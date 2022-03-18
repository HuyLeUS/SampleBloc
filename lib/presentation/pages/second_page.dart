import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sample_bloc/bloc/first_bloc_bloc.dart';
import 'package:sample_bloc/bloc/second_bloc.dart';
import 'package:sample_bloc/common/colors.dart';
import 'package:sample_bloc/common/images.dart';
import 'package:sample_bloc/presentation/widgets/item_meme.dart';
import 'package:sample_bloc/presentation/widgets/meme_loading.dart';
import 'package:sample_bloc/utils/screen_util.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _scrollController = ScrollController();
  final secondBloc = SecondBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.screen2),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.position.minScrollExtent,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 1000),
            );
          },
          backgroundColor: AppColors.grey,
          child: const Tab(
            child: ImageIcon(AssetImage(AppImages.iconArrowUp),
                size: 30, color: AppColors.black),
          ),
        ),
        body: BlocProvider(
          create: (context) => secondBloc..add(LoadMemeListEvent()),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: BlocBuilder<FirstBloc, FirstState>(
                builder: (context, state) {
                  return Text(
                    "${AppLocalizations.of(context)!.welcome} ${state.name}",
                    style: const TextStyle(
                      letterSpacing: 2,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  );
                },
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: ScreenUtils.height(context)),
                  child: RefreshIndicator(
                      child: BlocBuilder<SecondBloc, SecondState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var i = 0; i < 10; i++)
                                    const MemeLoading()
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: state.listMeme.length,
                              itemBuilder: (context, index) => Card(
                                  child:
                                      ItemMeme(meme: state.listMeme[index])));
                    },
                  ), onRefresh: () {
                    secondBloc.add(RefreshMemeListEvent());
                    return Future.delayed(const Duration(seconds: 1));
                  }),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
