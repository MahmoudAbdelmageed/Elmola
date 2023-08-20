// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
//
// class MessageContent extends StatelessWidget {
//   final List messsage;
//   const MessageContent({Key? key, required this.messsage})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 25,
//         vertical: 7,
//       ),
//       child:
//       Align(
//         alignment: messsage==userId.toString() ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
//           constraints: BoxConstraints(
//               minWidth: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width *.4),
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(15)),
//             color:  const Color(0xffeeeef0),
//           ),
//           child: Wrap(
//             children: [
//          Text(messsage[i],
//                   style:  TextStyle(
//                       color:messsage.type == "fileType"? Colors.blue:Color(0xff343433),
//                       fontWeight: FontWeight.w400,
//                       fontFamily: "AJannatLT",
//                       fontStyle: FontStyle.normal,
//                       fontSize: 16.0),
//                   textAlign:direction ==  TextDirection.rtl? TextAlign.left:TextAlign.right),
//             ],
//           ),
//         ),
//       ),
//
//
//
//
//     );
//   }
// }