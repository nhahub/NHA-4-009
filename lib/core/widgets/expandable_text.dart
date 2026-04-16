import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final TextStyle? actionStyle;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
    this.actionStyle,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  void _toggle(bool isOverflowing) {
    if (!isOverflowing) return;
    setState(() => isExpanded = !isExpanded);
  }

  bool _checkOverflow(String text, TextStyle style, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? AppStyles.regular14;

    final actionStyle = widget.actionStyle ??
        AppStyles.extraBold15.copyWith(
          color: isExpanded ? AppColors.orange : AppColors.lightGreen,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isOverflowing =
            _checkOverflow(widget.text, textStyle, constraints.maxWidth);

        return GestureDetector(
          onTap: () => _toggle(isOverflowing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                maxLines: isExpanded ? null : widget.maxLines,
                overflow: isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: textStyle,
              ),

              if (isOverflowing) ...[
                const SizedBox(height: 4),
                Text(
                  isExpanded ? "See less" : "See more",
                  style: actionStyle,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}