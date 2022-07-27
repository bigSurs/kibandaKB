import 'package:flutter/material.dart';

class IosStyleToast extends StatelessWidget {
  final String message;
  final bool isError;

  const IosStyleToast({Key? key, required this.message, required this.isError})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: isError ? Colors.red : Colors.green,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      isError ? Icons.error_outline : Icons.check,
                      color: Colors.white,
                    ),
                    Text(message)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
