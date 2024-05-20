import 'package:digit_ui_components/constants/AppView.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../theme/digit_theme.dart';

class DigitCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final CardType cardType;
  final bool inline;

  const DigitCard({
    required this.children,
    super.key,
    this.padding,
    this.inline = false,
    this.margin,
    this.onPressed,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    bool isTab = AppView.isTabletView(MediaQuery.of(context).size);
    return Container(
      //width: MediaQuery.of(context).size.width,
      // will take the max width of the content present inside this
      // provide a max width for the card

      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: cardType == CardType.secondary
            ? Border.all(
          width: 1,
          color: const DigitColors().light.genericDivider,
        )
            : null,
        color: cardType == CardType.secondary
            ? const DigitColors().light.paperSecondary
            : const DigitColors().light.paperPrimary,
        boxShadow: cardType == CardType.primary
            ? [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(.16),
            offset: const Offset(0, 1),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ]
            : [],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onPressed,
        child: Padding(
          padding: padding ??
              (isMobile
                  ? const EdgeInsets.all(kPadding * 2)
                  : isTab
                  ? const EdgeInsets.all(20)
                  : const EdgeInsets.all(kPadding * 3)),
          child: SingleChildScrollView(
            child: inline && !isMobile
                ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children
                  .asMap()
                  .entries
                  .map((entry) => Flexible(
                    child: Padding(
                                    padding: EdgeInsets.only(
                    right: entry.key == children.length - 1
                        ? 0
                        : 16,
                                    ),
                                    child: entry.value,
                                  ),
                  ))
                  .toList(),
            )
                : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isMobile
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children
                  .asMap()
                  .entries
                  .map((entry) => Padding(
                padding: EdgeInsets.only(
                  bottom: entry.key == children.length - 1
                      ? 0
                      : 16,
                ),
                child: entry.value,
              ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

enum CardType {
  primary,
  secondary,
}
