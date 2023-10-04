import 'package:flutter/material.dart';

import '../../../core/utils/style_utils.dart';
import '../../theme/app_colors.dart';

class ImageBubble extends StatefulWidget {
  final Image image;
  ImageBubble({
    required this.image,
  });

  @override
  _ImageBubbleState createState() => _ImageBubbleState();
}

class _ImageBubbleState extends State<ImageBubble>
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
      margin: EdgeInsets.only(top: StyleUtils.CUSTOM_PADDING_FORM_5_DEFAULT),
      child: Center(
          child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: widget.image,
          );
        },
      )),
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
          backgroundColor: OrtogColors.SLGcolor,
          heroTag: option.title,
          onPressed: () {
            option.onPressed();
            toggleBubble();
          },
          icon: Icon(option.icon),
          label: Text(option.title),
          // foregroundColor: OdebinColors.amarillo,
        ),
      ),
    );
  }
}
