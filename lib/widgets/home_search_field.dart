import "package:flutter/material.dart";

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xff53B175),

      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        fillColor: Color(0xffF2F3F2),
        filled: true,
        hintText: "Search Store",
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(Icons.search),
        ),

        prefixIconConstraints: BoxConstraints(maxWidth: 43, minHeight: 40),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
