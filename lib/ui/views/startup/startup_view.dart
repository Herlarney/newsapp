import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news_app_ass/ui/views/authentication/log_in/login_model.dart';
import 'package:stacked/stacked.dart';
import 'package:news_app_ass/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

// class StartupView extends StackedView<StartupViewModel> {
//   const StartupView({Key? key}) : super(key: key);

//   @override

//   Widget builder(
//     BuildContext context,
//     StartupViewModel viewModel,

//     Widget? child,
//   ) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'STACKED',
//               style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('Loading ...', style: TextStyle(fontSize: 16)),
//                 horizontalSpaceSmall,
//                 SizedBox(
//                   width: 16,
//                   height: 16,
//                   child: CircularProgressIndicator(
//                     color: Colors.black,
//                     strokeWidth: 6,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   StartupViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       StartupViewModel();

//   @override
//   void onMode(StartupViewModel viewModel){
//   viewModel.
//       SchedulerBinding.instance
//       .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
//   }

// }

class StartupView extends StatelessWidget {
  const StartupView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: () => LoginModel(),
              onViewModelReady: (viewModel){
    
      },
        builder: (context, viewModel, child) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator()
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text(
              //       'STACKED',
              //       style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              //     ),
              //     Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text('Loading ...', style: TextStyle(fontSize: 16)),
              //         horizontalSpaceSmall,
              //         SizedBox(
              //           width: 16,
              //           height: 16,
              //           child: const CircularProgressIndicator(
              //             color: Colors.black,
              //             strokeWidth: 6,
              //           ),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
            ),
          );
        });
  }
}
