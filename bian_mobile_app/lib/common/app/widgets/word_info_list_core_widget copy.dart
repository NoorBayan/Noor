// import 'package:bian_mobile_app/common/app/widgets/word_info_item.dart';
// import 'package:bian_mobile_app/common/widgets/improved_custom_list_pagination_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../common/widgets/clickable.dart';
// import '../../../../core/general/theme/theme.dart';
// import '../models/main_quran.dart';

// final _WordItemProvider =
//     Provider.autoDispose<MainQuran>((_) => throw UnimplementedError());

// class WordInfoListCoreWidget extends StatelessWidget {
//   const WordInfoListCoreWidget({
//     super.key,
//     required this.wordList,
//   });
//   final List<MainQuran> wordList;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20).r,
//       decoration: BoxDecoration(
//         color: AppColors.secondaryColors,
//         borderRadius: BorderRadius.circular(26),
//         boxShadow: AppTheme.primaryShadow,
//       ),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: ImprovedCustomListPaginationWidget.gridView(
//           baseList: ,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 10.w,
//             mainAxisSpacing: 20.h,
//             childAspectRatio: 2 / 3,
//             // mainAxisExtent: 200,
//           ),
//           // primary: false,
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           // itemCount: wordList.length,
//           itemBuilder: (context, index) {
//             final item = wordList[index];
//             return Clickable(
//               onTap: () {},
//               child: ProviderScope(
//                   overrides: [_WordItemProvider.overrideWithValue(item)],
//                   child: const _BuildWordInfoItem()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class WordInfoListCoreWidget extends StatelessWidget {
//   const WordInfoListCoreWidget({
//     super.key,
//     required this.wordList,
//   });
//   final List<MainQuran> wordList;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20).r,
//       decoration: BoxDecoration(
//         color: AppColors.secondaryColors,
//         borderRadius: BorderRadius.circular(26),
//         boxShadow: AppTheme.primaryShadow,
//       ),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 10.w,
//             mainAxisSpacing: 20.h,
//             childAspectRatio: 2 / 3,
//             // mainAxisExtent: 200,
//           ),
//           primary: false,
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: wordList.length,
//           itemBuilder: (context, index) {
//             final item = wordList[index];
//             return Clickable(
//               onTap: () {},
//               child: ProviderScope(
//                   overrides: [_WordItemProvider.overrideWithValue(item)],
//                   child: const _BuildWordInfoItem()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class _BuildWordInfoItem extends ConsumerWidget {
//   const _BuildWordInfoItem();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final data = ref.watch(_WordItemProvider);
//     return WordInfoItem(
//       title: data.uthmani,
//       subtitle1: data.phone,
//       // subtitle2: data.tran,
//     );
//   }
// }
