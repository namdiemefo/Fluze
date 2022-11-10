import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class AppBackButton extends StatelessWidget {
  final VoidCallback voidCallback;
  const AppBackButton({super.key, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: voidCallback,
        child: const Icon(Icons.arrow_back_ios_rounded)
    );
  }
}
