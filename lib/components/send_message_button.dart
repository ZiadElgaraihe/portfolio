import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class SendMessageButton extends StatefulWidget {
  const SendMessageButton({
    super.key,
    required this.onPressed,
  });

  final Future<void> Function() onPressed;

  @override
  State<SendMessageButton> createState() => _SendMessageButtonState();
}

class _SendMessageButtonState extends State<SendMessageButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.width, 44),
      ),
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await widget.onPressed();
              setState(() {
                _isLoading = false;
              });
            },
      child: _isLoading ? Text("Sending...") : Text("Send Message"),
    );
  }
}
