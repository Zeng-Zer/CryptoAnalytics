import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/z_search_bar.dart';
import '../../../constants.dart';
import '../../../theme.dart';
import 'crypto_asset_list.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  Widget buildToggleButton(ValueNotifier<bool> favorite) {
    return ToggleButtons(
      direction: Axis.vertical,
      onPressed: (int index) {
        favorite.value = !favorite.value;
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: violet[500],
      selectedColor: Colors.white,
      fillColor: violet[500],
      color: blueGrey[500],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 80.0,
      ),
      isSelected: [favorite.value],
      children: const [Text('Favorites')],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final favoriteOnly = useState(false);

    useListenable(controller);

    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: sideMargin.copyWith(top: 8),
                child: ZSearchBar(
                  hint: 'Search tokens',
                  focusNode: focusNode,
                  controller: controller,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: sideMargin,
                child: Row(
                  children: [
                    buildToggleButton(favoriteOnly),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: CryptoAssetList(
                  search: controller.text,
                  favoriteOnly: favoriteOnly.value,
                  onTap: () => focusNode.unfocus(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
