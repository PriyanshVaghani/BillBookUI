import 'package:flutter/material.dart';

// Widget buildBottomSheetTitleWidget(BuildContext context, String title) {
//   return Row(
//     children: [
//       Expanded(
//         child: Text(
//           title,
//           maxLines: 2,
//           overflow: TextOverflow.clip,
//           style: Theme.of(context).textTheme.displayLarge,
//         ),
//       ),
//       IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(Icons.cancel),
//       ),
//     ],
//   );
// }

class BuildBottomSheetTitleWidget extends StatelessWidget {
  const BuildBottomSheetTitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel),
        ),
      ],
    );
  }
}
