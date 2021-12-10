import 'package:flutter/material.dart';

boxShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0,
    blurRadius: 2,
    offset: const Offset(1, 3), // changes position of shadow
  );
}
