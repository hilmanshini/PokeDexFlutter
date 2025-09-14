import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon2/screen/home/pokemon_home_screen_card.dart';
import 'package:pokemon2/screen/home/pokemon_home_screen_viewmodel.dart';
import 'package:pokemon2/service/common/loading_widget.dart';
import 'package:pokemon2/service/model/pokemon_model.dart';
import 'package:pokemon2/utils/ext.dart';
import 'package:sizer/sizer.dart';

class PokeGrid extends StatefulWidget {
  final PokemonHomeScreenViewmodel viewModel;

  const PokeGrid(this.viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _PokeGrid();
}

class _PokeGrid extends State<PokeGrid> {
  PagingState<int, PokemonModel> _pagingState = PagingState();

  void fetch() {
    setState(() {
      _pagingState = _pagingState.copyWith(isLoading: true, error: null);
    });
    widget.viewModel.getPokemonList(widget.viewModel.page.value).listen((
      event,
    ) {
      // if (!_pagingState.hasNextPage || _pagingState.isLoading) return;
      var result = event;
      if (result.isLoading()) {
        _pagingState = _pagingState.copyWith(isLoading: true, error: null);
      } else if (result.isSucceed()) {
        var prevKey = widget.viewModel.page.value;
        widget.viewModel.page.value = widget.viewModel.page.value + 1;
        widget.viewModel.page.value = widget.viewModel.page.value;
        var ends = result.getData().isEmpty;
        setState(() {
          _pagingState = _pagingState.copyWith(
            pages: [...?_pagingState.pages, result.getData()],
            keys: [...?_pagingState.keys, prevKey],
            hasNextPage: !ends,
            isLoading: false,
          );
        });
      } else if (result.isFailure()) {
        setState(() {
          _pagingState = _pagingState.copyWith(isLoading: false, error: result);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  //
  // Future<void> _fetchNextPage(int pageKey) async {
  //   if (!_pagingState.hasNextPage || _pagingState.isLoading) return;
  //
  //   // Set loading
  //   setState(() {
  //     _pagingState = _pagingState.copyWith(isLoading: true, error: null);
  //   });
  //
  //   try {
  //     // Simulate network call
  //     await Future.delayed(const Duration(seconds: 1));
  //
  //     final newItems = List.generate(
  //       _pageSize,
  //       (index) => 'Item ${pageKey * _pageSize + index + 1}',
  //     );
  //
  //     final nextPageKey = newItems.length < _pageSize ? null : pageKey + 1;
  //
  //     setState(() {
  //       _pagingState = _pagingState.copyWith(
  //         pages: [...?_pagingState.pages, newItems],
  //         keys: [...?_pagingState.keys, pageKey],
  //         hasNextPage: nextPageKey != null,
  //         isLoading: false,
  //       );
  //     });
  //   } catch (error) {
  //     setState(() {
  //       _pagingState = _pagingState.copyWith(isLoading: false, error: error);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(top: 25.h),
    child: PagedGridView<int, PokemonModel>(
      state: _pagingState,
      fetchNextPage: () => fetch(),
      showNewPageErrorIndicatorAsGridChild: false,
      showNewPageProgressIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: context.isPortrait ? 0.3.w : 0.2.w,
      ),

      builderDelegate: PagedChildBuilderDelegate<PokemonModel>(
        itemBuilder: (context, item, index) => PokemonHomeScreenCard(item),
        firstPageErrorIndicatorBuilder: (context) => SizedBox.expand(
          child: InkWell(
            onTap: () => fetch(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ✅ center vertikal
              crossAxisAlignment: CrossAxisAlignment.center,
              // ✅ center horizontal
              children: const [Text('Error loading data, tap here to retry')],
            ),
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ✅ center vertikal
            crossAxisAlignment: CrossAxisAlignment.center,
            // ✅ center horizontal
            children: const [Text('No Data Found')],
          ),
        ),
        newPageErrorIndicatorBuilder: (context) => SizedBox.expand(
          child: InkWell(
            onTap: () => fetch(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ✅ center vertikal
              crossAxisAlignment: CrossAxisAlignment.center,
              // ✅ center horizontal
              children: const [Text('Error loading data, tap here to retry')],
            ),
          ),
        ),
        newPageProgressIndicatorBuilder: (context) =>
            Center(child: Column(children: [LoadingWidget()])),
      ),
      padding: const EdgeInsets.all(8),
    ),
  );
  //
  // @override
  // Widget build(BuildContext context) =>
  // Container(
  //   padding: EdgeInsets.only(top: 25.h),
  //   child: PagedGridView<int, String>(
  //     padding: EdgeInsets.all(16),
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 3.w,
  //       mainAxisSpacing: 3.w,
  //       childAspectRatio: 0.2.w,
  //     ),
  //     // pagingController: _pagingController,
  //     builderDelegate: PagedChildBuilderDelegate<String>(
  //       itemBuilder: (context, item, index) => Card(
  //         child: ConstrainedBox(
  //           constraints: BoxConstraints(
  //             minHeight: 150, // minimal tinggi
  //           ),
  //           child: PokemonHomeScreenCard(),
  //         ),
  //       ),
  //       firstPageErrorIndicatorBuilder: (context) =>
  //           const Center(child: Text('Error loading data')),
  //       noItemsFoundIndicatorBuilder: (context) =>
  //           const Center(child: Text('No items found')),
  //     ),
  //     // itemCount: 2,
  //     // itemBuilder: (context, index) {
  //     //   return
  //     //   ConstrainedBox(
  //     //     constraints: BoxConstraints(
  //     //       minHeight: 150, // minimal tinggi
  //     //     ),
  //     //     child: PokemonHomeScreenCard(),
  //     //   );
  //     // },
  //   ),
  // );
}
