import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_trade.dart';
import '../providers/crypto_info_provider.dart';

class BullBearBar extends StatelessWidget {
  const BullBearBar({
    Key? key,
    required this.trades,
  }) : super(key: key);

  final List<CryptoTrade> trades;

  @override
  Widget build(BuildContext context) {
    final buyTrades = trades
        .where((trade) => trade.direction == Direction.buy)
        .fold<double>(0, (previousValue, trade) => previousValue + trade.volume);
    final sellTrades = trades
        .where((trade) => trade.direction == Direction.sell)
        .fold<double>(0, (previousValue, trade) => previousValue + trade.volume);
    final totalVolume = buyTrades + sellTrades;
    final buyPercentage = buyTrades / totalVolume;
    final sellPercentage = sellTrades / totalVolume;
    const animationDuration = Duration(milliseconds: 300);
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: animationDuration,
            width: buyPercentage * MediaQuery.of(context).size.width,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedContainer(
            duration: animationDuration,
            width: sellPercentage * MediaQuery.of(context).size.width,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CryptoTradesView extends ConsumerWidget {
  const CryptoTradesView({
    Key? key,
    required this.assetId,
  }) : super(key: key);

  final String assetId;

  Widget buildTradeList(List<CryptoTrade> trades) {
    final dateFormat = DateFormat('HH:mm.ss');
    return ListView.builder(
      reverse: true,
      itemCount: trades.length,
      itemBuilder: (BuildContext context, int index) {
        final trade = trades[index];
        return Row(
          children: [
            Text(
              '${dateFormat.format(trade.timestamp)} ',
              style: textTheme().labelMedium?.copyWith(color: blueGrey.shade400),
            ),
            Text('[${trade.exchange.capitalize}] ',
                style: textTheme().labelMedium?.copyWith(color: blueGrey.shade600)),
            SizedBox(
              width: 36,
              child: Text(
                '${trade.direction.name.toUpperCase()} ',
                style: textTheme().labelMedium?.copyWith(
                    color: trade.direction == Direction.sell ? Colors.red : Colors.green),
              ),
            ),
            Text(
              '${trade.baseSymbol}/${trade.quoteSymbol}',
              style: textTheme().labelMedium?.copyWith(color: blueGrey.shade800),
            ),
            const Spacer(),
            Text(
              trade.volume.asCryptoDecimal,
              style: textTheme().labelMedium?.copyWith(color: blueGrey.shade800),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tradesStream = ref.watch(cryptoTradeProvider(assetId: assetId));
    return tradesStream.when(
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: Text('No trades yet')),
      data: (trades) => Column(
        children: [
          Expanded(child: buildTradeList(trades)),
          const SizedBox(height: 2),
          BullBearBar(trades: trades),
        ],
      ),
    );
  }
}
