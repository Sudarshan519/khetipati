import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/theme.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? ismultiline;

  const MyInputField(
      {Key? key,
      required this.hint,
      this.controller,
      this.widget,
      this.ismultiline = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            //margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            height: ismultiline! ? 160 : 52,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.1), width: 1.0),
              borderRadius: BorderRadius.circular(1),
            ),
            child: Row(children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  controller: controller,
                  style: subtitleStyle,
                  minLines: ismultiline! ? 2 : null,
                  maxLines: ismultiline! ? 6 : null,
                  // expands: true,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subtitleStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: context.theme.backgroundColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: context.theme.backgroundColor),
                    ),
                  ),
                ),
              ),
              widget == null ? Container() : Container(child: widget)
            ]))
      ]),
    );
  }
}