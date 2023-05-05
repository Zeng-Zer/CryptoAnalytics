import 'crypto_asset.dart';
import 'crypto_asset_history.dart';

class CryptoAssetDetail {
  CryptoAssetDetail({
    required this.asset,
    required this.history,
  });

  final CryptoAsset asset;
  final List<CryptoAssetHistory> history;
}
