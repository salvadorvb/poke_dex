import 'package:poke_dex/app/config/constants.dart';
import 'package:poke_dex/app/config/theme.dart';
import 'package:poke_dex/app/widgets/gap.dart';
import 'package:poke_dex/data/model/pokemon.dart';
import 'package:poke_dex/gen/assets.gen.dart';
import 'package:poke_dex/modules/bloc/state.dart';
import 'package:poke_dex/modules/pokemon/all_pokemon_tab.dart';
import 'package:poke_dex/modules/bloc/favourite_pokemom_cubit.dart';
import 'package:poke_dex/app/widgets/image.dart';
import 'package:poke_dex/modules/pokemon/favourite_pokemon_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScaffoldPage extends StatefulWidget {
  const AppScaffoldPage({Key? key}) : super(key: key);

  @override
  State<AppScaffoldPage> createState() => _AppScaffoldPageState();
}

class _AppScaffoldPageState extends State<AppScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: LocalImage(Assets.images.appLogo.path, height: 32),
        ),
        body: const Column(
          children: [
            _TabBarHeader(),
            Expanded(
              child: TabBarView(
                children: [
                  AllPokemonTab(),
                  FavouritePokemonTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarHeader extends StatelessWidget {
  const _TabBarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: ColoredBox(
        color: Colors.white,
        child: TabBar(
          unselectedLabelColor: const Color(0xff6B6B6B),
          labelColor: const Color(0xff161A33),
          indicatorColor: AppColors.primaryColor,
          labelPadding: const EdgeInsets.symmetric(vertical: Insets.xs),
          indicatorWeight: 3,
          tabs: [
            const Tab(
              child: Text(
                'Pokedex',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Tab(
              child:
              BlocBuilder<FavouritePokemonCubit, BlocState<List<Pokemon>>>(
                builder: (context, state) {
                  final count = state.data.length;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Mis favoritos',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      if (count != 0) ...[
                        const HGap(Insets.xs),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          padding: const EdgeInsets.all(Insets.xs),
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
