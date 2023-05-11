import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_binance_pair.dart';
import '../domain/crypto_candle.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoPairCandleChart extends HookConsumerWidget {
  const CryptoPairCandleChart({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CryptoBinancePair pair;

  static const autoScrollingDelta = 35;

  // Widget buildCandleChart(
  //     List<CryptoCandle> candles, ValueNotifier<ChartSeriesController?> chartSerieController) {
  //   return SfCartesianChart(
  //     trackballBehavior: TrackballBehavior(
  //       hideDelay: 1500,
  //       enable: true,
  //       lineType: TrackballLineType.none,
  //       activationMode: ActivationMode.longPress,
  //       tooltipSettings: InteractiveTooltip(
  //         enable: true,
  //         color: blueGrey.shade900,
  //         borderWidth: 0,
  //         borderColor: Colors.transparent,
  //         decimalPlaces: 2,
  //       ),
  //       lineColor: blueGrey.shade400,
  //       lineWidth: 1,
  //       lineDashArray: const [5, 5],
  //     ),
  //     // crosshairBehavior: CrosshairBehavior(
  //     //   activationMode: ActivationMode.longPress,
  //     //   enable: true,
  //     //   lineType: CrosshairLineType.both,
  //     //   lineWidth: 1,
  //     // ),
  //     zoomPanBehavior: ZoomPanBehavior(
  //       enablePanning: true,
  //       zoomMode: ZoomMode.x,
  //     ),
  //     primaryXAxis: DateTimeAxis(
  //       // rangeController: rangeController.value,
  //       dateFormat: DateFormat.Hm(),
  //       autoScrollingMode: AutoScrollingMode.end,
  //       enableAutoIntervalOnZooming: false,
  //       majorGridLines: const MajorGridLines(width: 0),
  //       autoScrollingDelta: autoScrollingDelta,
  //       autoScrollingDeltaType: DateTimeIntervalType.minutes,
  //       // intervalType: DateTimeIntervalType.minutes,
  //       // interval: 5,
  //       // desiredIntervals: 5,
  //       labelStyle: textTheme().labelSmall?.copyWith(color: blueGrey.shade600),
  //     ),
  //     primaryYAxis: NumericAxis(
  //       opposedPosition: true,
  //       labelAlignment: LabelAlignment.end,
  //       tickPosition: TickPosition.inside,
  //       labelPosition: ChartDataLabelPosition.inside,
  //       rangePadding: ChartRangePadding.round,
  //       anchorRangeToVisiblePoints: true,
  //       enableAutoIntervalOnZooming: false,
  //       desiredIntervals: 4,
  //       // maximum: maxYValue,
  //       // minimum: minYValue,
  //       // interval: yInterval,
  //       axisLine: const AxisLine(width: 0),
  //       majorTickLines: const MajorTickLines(size: 0),
  //       minorGridLines: const MinorGridLines(width: 0),
  //       minorTickLines: const MinorTickLines(size: 0),
  //       axisLabelFormatter: (details) => ChartAxisLabel(
  //         details.value.asCryptoDecimal,
  //         textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
  //       ),
  //     ),
  //     series: [
  //       CandleSeries<CryptoCandle, DateTime>(
  //         // onRendererCreated: (controller) =>
  //         //     Future(() => chartSerieController.value ??= controller),
  //         // dataLabelSettings: const DataLabelSettings(isVisible: false),
  //         dataSource: candles,
  //         xValueMapper: (CryptoCandle data, _) =>
  //             DateTime.fromMillisecondsSinceEpoch(data.openTime),
  //         lowValueMapper: (CryptoCandle data, _) => data.low,
  //         highValueMapper: (CryptoCandle data, _) => data.high,
  //         openValueMapper: (CryptoCandle data, _) => data.open,
  //         closeValueMapper: (CryptoCandle data, _) => data.close,
  //         enableSolidCandles: true,
  //         // yValueMapper: (CryptoCandle data, _) => data.priceUsd,
  //         // color: blueGrey.shade300,
  //       ),
  //     ],
  //   );
  // }

  Widget buildCandleChart(
      List<CryptoCandle> candles, ValueNotifier<ChartSeriesController?> chartSerieController) {
    // final rangeController = useState(RangeController(start: 0, end: 0));
    // chartSerieController.addListener(() {
    //   if (chartSerieController.value != null) {
    //     chartSerieController.value!.
    //   }
    // });
    // final startIndex = useState(candles.length - autoScrollingDelta - 0);
    // print('startIndex: ${startIndex.value}');
    // final rangeCandles =
    //     candles.getRange(startIndex.value, startIndex.value + autoScrollingDelta).toList();
    // print(rangeCandles.length);
    // final maxValue = rangeCandles.map((e) => e.high).reduce(max);
    // final minValue = rangeCandles.map((e) => e.low).reduce(min);
    // print('maxValue: $maxValue - minValue: $minValue');
    // final maxYValue = maxValue * 1.001;
    // final minYValue = minValue * 0.999;
    // print('maxYValue: $maxYValue - minYValue: $minYValue');
    // final yInterval = (maxYValue - minYValue) * 0.99999 / 4;
    // rangeController.value.addListener(() {
    //   if (rangeController.value.start != 0 && rangeController.value.end != 0) {
    //     print('start: ${rangeController.value.start}');
    //     print('end: ${rangeController.value.end}');
    //     final startOpenTime = rangeController.value.start as DateTime;
    //     print('startOpenTime: $startOpenTime');
    //     startIndex.value = candles.indexWhere((element) {
    //       return startOpenTime.millisecondsSinceEpoch == element.openTime;
    //     });
    //   }
    // });
    return SfCartesianChart(
      // onTrackballPositionChanging: (args) {
      //   final double? price = args.chartPointInfo.chartDataPoint?.y;
      //   args.chartPointInfo.label = '${price?.asCryptoCurrency}';
      // },
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
        zoomMode: ZoomMode.x,
      ),
      primaryXAxis: DateTimeAxis(
        // rangeController: rangeController.value,
        dateFormat: DateFormat.Hm(),
        autoScrollingMode: AutoScrollingMode.end,
        enableAutoIntervalOnZooming: false,
        majorGridLines: const MajorGridLines(width: 0),
        autoScrollingDelta: autoScrollingDelta,
        autoScrollingDeltaType: DateTimeIntervalType.minutes,
        intervalType: DateTimeIntervalType.minutes,
        interval: 5,
        desiredIntervals: 5,
        labelStyle: textTheme().labelSmall?.copyWith(color: blueGrey.shade600),
      ),
      primaryYAxis: NumericAxis(
        opposedPosition: true,
        labelAlignment: LabelAlignment.end,
        tickPosition: TickPosition.inside,
        labelPosition: ChartDataLabelPosition.inside,
        rangePadding: ChartRangePadding.additional,
        anchorRangeToVisiblePoints: true,
        enableAutoIntervalOnZooming: true,
        desiredIntervals: 1,
        // maximum: maxYValue,
        // minimum: minYValue,
        // interval: yInterval,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        minorGridLines: const MinorGridLines(width: 0),
        minorTickLines: const MinorTickLines(size: 0),
        axisLabelFormatter: (details) => ChartAxisLabel(
          details.value.asCryptoDecimal,
          textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
        ),
      ),
      series: [
        CandleSeries<CryptoCandle, DateTime>(
          onRendererCreated: (controller) =>
              Future(() => chartSerieController.value ??= controller),
          dataLabelSettings: const DataLabelSettings(isVisible: false),
          dataSource: candles,
          xValueMapper: (CryptoCandle data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.openTime),
          lowValueMapper: (CryptoCandle data, _) => data.low,
          highValueMapper: (CryptoCandle data, _) => data.high,
          openValueMapper: (CryptoCandle data, _) => data.open,
          closeValueMapper: (CryptoCandle data, _) => data.close,
          enableSolidCandles: true,
          // yValueMapper: (CryptoCandle data, _) => data.priceUsd,
          // color: blueGrey.shade300,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartSerieController = useState<ChartSeriesController?>(null);
    useAutomaticKeepAlive();
    return ref.watch(fetchCandlesProvider(symbol: pair.symbol)).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          data: (candles) => buildCandleChart(candles, chartSerieController),
        );
  }
}
