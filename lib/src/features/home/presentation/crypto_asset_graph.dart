import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_asset_history.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoAssetChart extends ConsumerStatefulWidget {
  const CryptoAssetChart({
    Key? key,
    required this.assetId,
    required this.initialHistory,
  }) : super(key: key);

  final String assetId;
  final List<CryptoAssetHistory> initialHistory;

  @override
  ConsumerState createState() => _CryptoAssetChartState();
}

class _CryptoAssetChartState extends ConsumerState<CryptoAssetChart> {
  late List<CryptoAssetHistory> history;
  ChartSeriesController? _chartSeriesController;
  late double maxValue;
  late double minValue;
  late double maxYValue;
  late double minYValue;
  late double yInterval;

  void updateChartDimension({required bool init}) {
    final maxValue = history.map((e) => e.priceUsd).reduce(max);
    final minValue = history.map((e) => e.priceUsd).reduce(min);
    final maxYValue = maxValue * 1.005;
    final minYValue = minValue * 0.995;
    final yInterval = (maxYValue - minYValue) * 0.99999 / 4;
    if (init || maxValue != this.maxValue || minValue != this.minValue) {
      setState(() {
        this.maxValue = maxValue;
        this.minValue = minValue;
        this.maxYValue = maxYValue;
        this.minYValue = minYValue;
        this.yInterval = yInterval;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      history = widget.initialHistory;
    });
    updateChartDimension(init: true);
    super.initState();
  }

  void updateChartDataSource(List<CryptoAssetHistory> newHistory) {
    // Remove old times
    final diffIdx = history.indexWhere((e) => e.time == newHistory.first.time);
    final removedIndexes = List.generate(diffIdx, (index) => index);
    for (var i in removedIndexes) {
      print('removing ${history[i].time.asDateTime}');
      history.removeAt(i);
    }

    // Add new times
    final lastDiffIdx = newHistory.indexWhere((e) => e.time == history.last.time) + 1;
    final addedIndexes = [for (var i = lastDiffIdx; i < newHistory.length; i++) i];
    for (var i in addedIndexes) {
      print('Adding ${newHistory[i].time.asDateTime}');
      history.add(newHistory[i]);
    }

    updateChartDimension(init: false);

    _chartSeriesController!.updateDataSource(
      addedDataIndexes: addedIndexes,
      removedDataIndexes: removedIndexes,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(fetchAssetHistoryProvider(assetId: widget.assetId, refresh: true), (previous, next) {
      if (next.hasValue &&
          next.value != null &&
          next.value!.first.time != history.first.time &&
          next.value!.last.time != history.last.time &&
          next.value!.length == history.length) {
        final newHistory = next.value!;
        updateChartDataSource(newHistory);
      }
    });

    return SfCartesianChart(
      onTrackballPositionChanging: (args) {
        final double? price = args.chartPointInfo.chartDataPoint?.y;
        args.chartPointInfo.label = '${price?.asCryptoCurrency}';
      },
      trackballBehavior: TrackballBehavior(
        hideDelay: 1500,
        enable: true,
        lineType: TrackballLineType.vertical,
        activationMode: ActivationMode.longPress,
        tooltipSettings: InteractiveTooltip(
          enable: true,
          color: blueGrey.shade900,
          borderWidth: 0,
          borderColor: Colors.transparent,
          decimalPlaces: 2,
        ),
        lineColor: blueGrey.shade400,
        lineWidth: 1,
        lineDashArray: const [5, 5],
      ),
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
      ),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.Hm(),
        autoScrollingMode: AutoScrollingMode.end,
        enableAutoIntervalOnZooming: false,
        majorGridLines: const MajorGridLines(width: 0),
        autoScrollingDelta: 10,
        autoScrollingDeltaType: DateTimeIntervalType.hours,
        interval: 2,
        labelStyle: textTheme().labelSmall?.copyWith(color: blueGrey.shade600),
      ),
      primaryYAxis: NumericAxis(
        opposedPosition: true,
        labelAlignment: LabelAlignment.end,
        tickPosition: TickPosition.inside,
        labelPosition: ChartDataLabelPosition.inside,
        // isVisible: false,
        maximum: maxYValue,
        minimum: minYValue,
        interval: yInterval,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        minorGridLines: const MinorGridLines(width: 0),
        minorTickLines: const MinorTickLines(size: 0),
        axisLabelFormatter: (details) => ChartAxisLabel(
          details.value.asCryptoCurrency,
          textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
        ),
      ),
      series: [
        LineSeries<CryptoAssetHistory, DateTime>(
          onRendererCreated: (controller) => _chartSeriesController = controller,
          dataSource: history,
          xValueMapper: (CryptoAssetHistory data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.time),
          yValueMapper: (CryptoAssetHistory data, _) => data.priceUsd,
          color: blueGrey.shade300,
        ),
      ],
    );
  }
}

class CryptoAssetPriceChartHeader extends HookConsumerWidget {
  const CryptoAssetPriceChartHeader({
    Key? key,
    required this.assetId,
  }) : super(key: key);

  final String assetId;

  Widget buildPriceChange(double? change) {
    if (change == null) return const SizedBox.shrink();
    final color = change >= 0 ? Colors.green : Colors.red;
    final changeAbs = change.abs();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          change >= 0 ? Icons.trending_up : Icons.trending_down,
          color: color,
          size: 24,
        ),
        const SizedBox(width: 4),
        Text(changeAbs.asPercentage, style: textTheme().labelLarge?.copyWith(color: color)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoAsset = ref.watch(fetchAssetProvider(assetId));
    return cryptoAsset.when(
      skipLoadingOnReload: true,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (asset) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: asset.logoSvg.toOption().match(
                  () => const SizedBox(width: 32, height: 32),
                  (svg) => SvgPicture.string(svg, height: 32, width: 32),
                ),
          ),
          Column(
            children: [
              Text(
                'Price Chart',
                style: textTheme().bodyMedium?.copyWith(color: blueGrey.shade600),
                textAlign: TextAlign.left,
              ),
              Text(
                asset.priceUsd.asCryptoCurrency,
                style: textTheme().titleLarge,
                textAlign: TextAlign.left,
              ),
              buildPriceChange(asset.changePercent24Hr),
            ],
          ),
        ],
      ),
    );
  }
}

class CryptoAssetGraph extends HookConsumerWidget {
  const CryptoAssetGraph({
    Key? key,
    required this.assetId,
  }) : super(key: key);

  final String assetId;

  Widget buildCryptoAssetChart(WidgetRef ref) {
    final history = ref.watch(fetchAssetHistoryProvider(assetId: assetId));
    return history.when(
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (history) => CryptoAssetChart(assetId: assetId, initialHistory: history),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CryptoAssetPriceChartHeader(assetId: assetId),
            buildCryptoAssetChart(ref),
          ],
        ),
      ),
    );
  }
}
