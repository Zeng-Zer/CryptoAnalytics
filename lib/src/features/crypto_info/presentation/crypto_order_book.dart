import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme.dart';
import '../../../utils/extensions.dart';
import '../domain/crypto_order.dart';
import '../providers/crypto_info_provider.dart';

class CryptoOrderBook extends HookConsumerWidget {
  const CryptoOrderBook({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  final String symbol;

  Widget buildHeader() {
    return Column(
      children: [
        Text(
          'Order book',
          style: textTheme().titleSmall?.copyWith(color: blueGrey.shade500),
        ),
        const SizedBox(height: 4),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
                    ),
                    Text(
                      'Bid',
                      style: textTheme().labelSmall?.copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ask',
                      style: textTheme().labelSmall?.copyWith(color: Colors.red),
                    ),
                    Text(
                      'Quantity',
                      style: textTheme().labelSmall?.copyWith(color: blueGrey.shade500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildRow(CryptoOrderBidAsk bidAsk, Color color, bool reverse) {
    final style = textTheme().labelSmall?.copyWith(letterSpacing: -0.8);
    final texts = [
      Text(bidAsk.quantity.asCryptoDecimal, style: style),
      Text('${bidAsk.price}', style: style?.copyWith(color: color)),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: reverse ? texts.reversed.toList() : texts,
    );
  }

  Widget buildList(CryptoOrder book) {
    if (book.bids.isEmpty && book.asks.isEmpty) {
      return const Center(child: Text('This pair has no orders yet.'));
    }

    // max length of bids and asks
    final maxLength = book.bids.length > book.asks.length ? book.bids.length : book.asks.length;

    return ListView.builder(
      itemCount: maxLength,
      itemBuilder: (context, index) {
        final bid = index >= book.bids.length ? null : book.bids.elementAt(index);
        final ask = index >= book.asks.length ? null : book.asks.elementAt(index);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: (bid != null) ? buildRow(bid, Colors.green, false) : const SizedBox.shrink(),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: (ask != null) ? buildRow(ask, Colors.red, true) : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderBook = ref.watch(fetchOrderBookProvider(symbol));
    return orderBook.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text(error.toString()),
      data: (book) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(),
          const Divider(indent: 10, endIndent: 10),
          Expanded(child: buildList(book)),
        ],
      ),
    );
  }
}
