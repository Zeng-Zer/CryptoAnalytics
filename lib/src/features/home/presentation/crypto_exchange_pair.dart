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
    required this.isExpanded,
  }) : super(key: key);

  final CryptoBinancePair pair;
  final double logoSize;
  final bool isExpanded;

  Widget? buildLogo(WidgetRef ref, String symbol, double size) {
    return ref.watch(fetchLogoProvider(symbol)).whenOrNull(
          data: (logo) => logo != null ? SvgLogoString(logo: logo, size: size) : null,
        );
  }

  Widget buildCompact() {
    final fontSize = (textTheme().labelSmall?.fontSize ?? 12) - 2;
    final style = textTheme()
        .labelSmall
        ?.copyWith(color: blueGrey.shade600, fontSize: fontSize, letterSpacing: -0.2);
    return Text('${pair.baseAsset}/${pair.quoteAsset}', style: style);
  }

  Widget buildExpanded(Widget? baseLogo, Widget? quoteLogo) {
    final style = textTheme().labelSmall?.copyWith(color: blueGrey.shade600);
    return Row(
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
        Text(pair.quoteAsset, style: style),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseLogo = buildLogo(ref, pair.baseAsset, logoSize);
    final quoteLogo = buildLogo(ref, pair.quoteAsset, logoSize);
    return isExpanded ? buildExpanded(baseLogo, quoteLogo) : buildCompact();
  }
}
