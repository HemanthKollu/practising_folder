// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// // import 'package:flutter_quill/flutter_quill.dart';

// class StyledTextfieldUi extends StatefulWidget {
//   const StyledTextfieldUi({super.key});

//   @override
//   State<StyledTextfieldUi> createState() => _StyledTextfieldUiState();
// }

// class _StyledTextfieldUiState extends State<StyledTextfieldUi> {
//   final QuillController _quillController = QuillController.basic();
//   final ScrollController _scrollController = ScrollController();
//   final FocusNode _focusNode = FocusNode();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 700,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black), 
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//                 child: QuillEditor(
//                   configurations: QuillEditorConfigurations(
//                     controller: _quillController,
//                     autoFocus: true,
//                     scrollable: true,
//                     expands: false,
//                     ),
//                     focusNode: _focusNode,
//                     scrollController: _scrollController,
//                     _quillContainer.readOnly = false,
//                   ),
//                 ),
//               Container(
//                 width: 700,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
//                   border: Border(bottom: BorderSide(color: Colors.black), left: BorderSide(color: Colors.black), right: BorderSide(color: Colors.black))
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: QuillSimpleToolbar(
//                   controller: _quillController,
//                   config: QuillSimpleToolbarConfig(
//                   showAlignmentButtons: true,
//                   showBackgroundColorButton: true,
                  
                  
//                   showColorButton: true,
//                   showDividers: true,
                  
                  
//                   showHeaderStyle: true,
//                   showIndent: true,
//                   showLink: true,
//                   showListBullets: true,
//                   showListCheck: true,
//                   showListNumbers: true,

//                 ),
//                 ),  
//                 ),
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(
//                 onPressed: (){
//                   final json = _quillController.document.toDelta().toJson();
//                 }, 
//                 child: Text('Save'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
