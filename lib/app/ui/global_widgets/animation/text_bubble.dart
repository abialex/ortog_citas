import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class TextBubble extends StatefulWidget {
  final double fontsize;
  final String text;
  final TextAlign alignment;
  final FontWeight? fontWeight;
  TextBubble(
      {required this.text,
      this.fontsize = 12,
      this.alignment = TextAlign.center,
      this.fontWeight});

  @override
  _TextBubbleState createState() => _TextBubbleState();
}

class _TextBubbleState extends State<TextBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Text(
              widget.text,
              textAlign: widget.alignment,
              style: TextStyle(
                  fontSize: widget.fontsize, fontWeight: widget.fontWeight),
            ),
          );
        },
      ),
    );
  }
}

class FloatingActionOption {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  FloatingActionOption(
      {required this.icon, required this.title, required this.onPressed});
}

class FloatingActionItem extends StatelessWidget {
  final FloatingActionOption option;
  final Animation<double> animation;
  final VoidCallback toggleBubble;

  FloatingActionItem({
    required this.option,
    required this.animation,
    required this.toggleBubble,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: FloatingActionButton.extended(
          backgroundColor: SlgColors.SLGcolor,
          heroTag: option.title,
          onPressed: () {
            option.onPressed();
            toggleBubble();
          },
          icon: Icon(option.icon),
          label: Text(option.title),
        ),
      ),
    );
  }
}
