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
    required this.baseLogoSize,
    required this.quoteLogoSize,
    this.textStyle,
  }) : super(key: key);

  final CryptoBinancePair pair;
  final double baseLogoSize;
  final double quoteLogoSize;
  final TextStyle? textStyle;

  Widget? buildLogo(WidgetRef ref, String symbol, double size) {
    return ref.watch(fetchLogoProvider(symbol)).whenOrNull(
          data: (logo) => logo != null ? SvgLogoString(logo: logo, size: size) : null,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseLogo = buildLogo(ref, pair.baseAsset, baseLogoSize);
    final quoteLogo = buildLogo(ref, pair.quoteAsset, quoteLogoSize);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (baseLogo != null) ...[
            baseLogo,
            const SizedBox(width: 4),
          ],
          Icon(Icons.swap_horiz, size: quoteLogoSize, color: blueGrey.shade600),
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
