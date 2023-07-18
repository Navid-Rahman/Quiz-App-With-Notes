import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz.dart';

void main() {
  runApp(const Quiz());
}

// class QuizApp extends StatelessWidget {
//   const QuizApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.deepPurple,
//                 Colors.purple,
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child:  StartScreen(),
//         ),
//       ),
//     );
//   }
// }






/** There are three extremely important (stateful) widget lifecycle methods you should be aware of:

          * ! initState(): Executed by Flutter when the StatefulWidget's State object is initialized

          * ! build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called

          * ! dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally) 
**/