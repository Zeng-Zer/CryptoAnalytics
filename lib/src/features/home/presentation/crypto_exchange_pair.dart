import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/svg_logo_string.dart';
import '../../../theme.dart';
import '../domain/crypto_binance_pair.dart';
import 'providers/crypto_asset_provider.dart';

class CryptoExchangePair extends ConsumerWidget {
  const CryptoExchangePair({
    Key? key,
    required this.pair,
    required this.logoSize,
    this.textStyle,
  }) : super(key: key);

  final CryptoBinancePair pair;
  final double logoSize;
  final TextStyle? textStyle;

  Widget? buildLogo(WidgetRef ref, String symbol) {
    return ref.watch(fetchLogoProvider(symbol)).whenOrNull(
          data: (logo) => logo != null ? SvgLogoString(logo: logo, size: logoSize) : null,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseLogo = buildLogo(ref, pair.baseAsset);
    final quoteLogo = buildLogo(ref, pair.quoteAsset);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (baseLogo != null) ...[
            baseLogo,
            const SizedBox(width: 4),
          ],
          Icon(Icons.swap_horiz, size: logoSize, color: blueGrey.shade600),
          const SizedBox(width: 4),
          if (quoteLogo != null) ...[
            quoteLogo,
            const SizedBox(width: 4),
          ],
          Text(
            pair.quoteAsset,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
