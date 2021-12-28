import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';

class Search extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const Search({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<Search> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: style.color),
            suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: style.color),
                onPressed: () => controller.clear()),
            hintText: widget.hintText,
            hintStyle: style,
            border: InputBorder.none,
          ),
          style: style,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

// class Search extends StatefulWidget {
//   final String text;
//   final ValueChanged<String> onChanged;
//   final String hintText;
//
//   const Search({
//     Key? key,
//     required this.text,
//     required this.onChanged,
//     required this.hintText,
//   }) : super(key: key);
//
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   final searchController = TextEditingController();
//
//   Widget build(BuildContext context) {
//     final styleActive = TextStyle(color: Colors.grey);
//     final styleHint = TextStyle(color: Colors.grey);
//     final style = widget.text.isEmpty ? styleHint : styleActive;
//
//     return Container(
//       height: 42,
//       margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(40),
//         color: Colors.white,
//         border: Border.all(color: Colors.black26),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: TextField(
//           controller: searchController,
//           decoration: InputDecoration(
//             prefixIcon: Icon(Icons.search, color: style.color),
//             //prefixIcon:
//             suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
//             hintText: widget.hintText,
//             hintStyle: style,
//             border: InputBorder.none,
//           ),
//           style: style,
//           onChanged: widget.onChanged,
//         ),
//       ),
//     );
//   }
// }
