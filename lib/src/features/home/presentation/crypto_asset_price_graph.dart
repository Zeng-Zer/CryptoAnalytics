import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_asset_history.dart';
import 'crypto_price_change.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoAssetPriceChart extends ConsumerStatefulWidget {
  const CryptoAssetPriceChart({
    Key? key,
    required this.assetId,
    required this.initialHistory,
  }) : super(key: key);

  final String assetId;
  final List<CryptoAssetHistory> initialHistory;

  @override
  ConsumerState createState() => _CryptoAssetChartState();
}

class _CryptoAssetChartState extends ConsumerState<CryptoAssetPriceChart>
    with AutomaticKeepAliveClientMixin {
  late List<CryptoAssetHistory> history;
  ChartSeriesController? _chartSeriesController;
  late double maxValue;
  late double minValue;
  late double maxYValue;
  late double minYValue;
  late double yInterval;

  @override
  void initState() {
    setState(() {
      history = widget.initialHistory;
    });
    super.initState();
  }

  void updateChartDataSource(List<CryptoAssetHistory> newHistory) {
    // Remove old times
    final diffIdx = history.indexWhere((e) => e.time == newHistory.first.time);
    final removedIndexes = List.generate(diffIdx, (index) => index);
    for (var i in removedIndexes) {
      print('removing ${history[i].time.asDateTime} $i');
      history.removeAt(i);
    }

    // Add new times
    final lastDiffIdx = newHistory.indexWhere((e) => e.time == history.last.time) + 1;
    final addedIndexes = [for (var i = lastDiffIdx; i < newHistory.length; i++) i];
    for (var i in addedIndexes) {
      print('Adding ${newHistory[i].time.asDateTime} $i');
      history.add(newHistory[i]);
    }

    _chartSeriesController!.updateDataSource(
      addedDataIndexes: addedIndexes,
      removedDataIndexes: removedIndexes,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ref.listen(fetchAssetHistoryProvider(assetId: widget.assetId, refresh: true), (previous, next) {
      if (next.hasValue &&
          next.value != null &&
          next.value!.firstOrNull?.time != history.firstOrNull?.time &&
          next.value!.lastOrNull?.time != history.lastOrNull?.time &&
          next.value!.length == history.length &&
          history.isNotEmpty) {
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
        rangePadding: ChartRangePadding.round,
        anchorRangeToVisiblePoints: true,
        enableAutoIntervalOnZooming: true,
        desiredIntervals: 3,
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

  @override
  bool get wantKeepAlive => true;
}

class CryptoAssetPriceChartHeader extends HookConsumerWidget {
  const CryptoAssetPriceChartHeader({
    Key? key,
    required this.assetId,
  }) : super(key: key);

  final String assetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoAsset = ref.watch(fetchAssetProvider(assetId));
    return cryptoAsset.when(
      skipLoadingOnReload: true,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (asset) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${asset.name} (${asset.symbol})',
              style: textTheme().titleLarge?.copyWith(color: blueGrey.shade800),
            ),
            Text(
              'Price Chart (24h)',
              style: textTheme().bodyMedium?.copyWith(color: blueGrey.shade600),
              textAlign: TextAlign.left,
            ),
            Text(
              asset.priceUsd.asCryptoCurrency,
              style: textTheme().titleLarge,
              textAlign: TextAlign.left,
            ),
            CryptoPriceChange(
              change: asset.changePercent24Hr ?? 0,
              style: textTheme().labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoAssetPriceGraph extends HookConsumerWidget {
  const CryptoAssetPriceGraph({
    Key? key,
    required this.assetId,
  }) : super(key: key);

  final String assetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(fetchAssetHistoryProvider(assetId: assetId));
    return history.when(
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (history) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CryptoAssetPriceChart(
              assetId: assetId,
              initialHistory: history,
            ),
          ),
        ],
      ),
    );
  }
}
