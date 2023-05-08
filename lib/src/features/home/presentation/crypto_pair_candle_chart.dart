import 'package:crypto_analytics/src/features/home/presentation/providers/crypto_asset_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme.dart';
import '../domain/crypto_binance_pair.dart';
import '../domain/crypto_candle.dart';

class CryptoPairCandleChart extends HookConsumerWidget {
  const CryptoPairCandleChart({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final CryptoBinancePair pair;

  Widget buildCandleChart(List<CryptoCandle> candles) {
    print(candles);
    return SfCartesianChart(
      // onTrackballPositionChanging: (args) {
      // final double? price = args.chartPointInfo.chartDataPoint?.y;
      // args.chartPointInfo.label = '${price?.asCryptoCurrency}';
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
      // zoomPanBehavior: ZoomPanBehavior(
      //   enablePanning: true,
      // ),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.Hm(),
        autoScrollingMode: AutoScrollingMode.end,
        enableAutoIntervalOnZooming: false,
        majorGridLines: const MajorGridLines(width: 0),
        // autoScrollingDelta: 10,
        // autoScrollingDeltaType: DateTimeIntervalType.hours,
        interval: 2,
        labelStyle: textTheme().labelSmall?.copyWith(color: blueGrey.shade600),
      ),
      primaryYAxis: NumericAxis(
        opposedPosition: true,
        labelAlignment: LabelAlignment.end,
        tickPosition: TickPosition.inside,
        labelPosition: ChartDataLabelPosition.inside,
        // isVisible: false,
        // maximum: maxYValue,
        // minimum: minYValue,
        // interval: yInterval,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        minorGridLines: const MinorGridLines(width: 0),
        minorTickLines: const MinorTickLines(size: 0),
        // axisLabelFormatter: (details) => ChartAxisLabel(
        //   details.value.asCryptoCurrency,
        //   textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
        // ),
      ),
      series: [
        CandleSeries<CryptoCandle, DateTime>(
          // onRendererCreated: (controller) => _chartSeriesController = controller,
          dataSource: candles,
          xValueMapper: (CryptoCandle data, _) =>
              DateTime.fromMillisecondsSinceEpoch(data.openTime),
          lowValueMapper: (CryptoCandle data, _) => data.low,
          highValueMapper: (CryptoCandle data, _) => data.high,
          openValueMapper: (CryptoCandle data, _) => data.open,
          closeValueMapper: (CryptoCandle data, _) => data.close,
          // yValueMapper: (CryptoCandle data, _) => data.priceUsd,
          // color: blueGrey.shade300,
        ),
      ],
    );
  }

//   {
//   required String exchange,
//   required String baseId,
//   required String quoteId,
//   String interval = 'm1',
//       int? start,
//   int? end,
// }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    return ref.watch(fetchCandlesProvider(symbol: pair.symbol)).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          data: (candles) => buildCandleChart(candles),
        );
  }
}
