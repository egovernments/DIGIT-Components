/// A widget that displays a dialog with a list of action buttons.
/// The dialog can be customized with width, height, and spacing between buttons.

///Example usage:
///``` ActionCard(
///   width: 300,
///   height: 400,
///   spacing: 16,
///   actions: [
///     Button(
///       label: 'Action 1',
///       onPressed: () {
///         // Handle Action 1
///       },
///     ),
///     Button(
///       label: 'Action 2',
///       onPressed: () {
///         // Handle Action 2
///       },
///     ),
///   ],
/// )```

import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../helper_widget/button_list.dart';

class ActionCard extends StatelessWidget {
  /// The width of the dialog. If null, defaults to a responsive width based on screen size.
  final double? width;

  /// The height of the dialog. If null, defaults to a responsive height based on screen size.
  final double? height;

  /// A list of action buttons to be displayed in the dialog.
  final List<Button> actions;

  /// The spacing between the action buttons. If null, defaults to a responsive spacing based on screen size.
  final double? spacing;

  const ActionCard({
    super.key,
    this.width,
    this.height,
    this.spacing,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    bool isTab = AppView.isTabletView(MediaQuery.of(context).size);
    double? cardWidth = width;

    return Dialog.fullscreen(
      backgroundColor: const DigitColors().transparent,
      child: Center(
        child: Container(
          width: cardWidth,
          height: height,
          margin: EdgeInsets.symmetric(
              vertical: height == null
                  ? isMobile
                      ? PopUpCardConstant.verticalMarginMobile
                      : isTab
                          ? PopUpCardConstant.verticalMarginTab
                          : PopUpCardConstant.verticalMarginDesktop
                  : 0,
              horizontal: cardWidth == null
                  ? isMobile
                      ? PopUpCardConstant.horizontalMarginMobile
                      : isTab
                          ? PopUpCardConstant.horizontalMarginTab
                          : PopUpCardConstant.horizontalMarginDesktop
                  : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(spacer1),
            color: const DigitColors().light.paperPrimary,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(.16),
                offset: const Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// A scrollable container to accommodate the list of action buttons
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(isMobile
                            ? spacer4
                            : isTab
                                ? spacer5
                                : spacer6),
                        child: ButtonListTile(
                          /// A widget that displays the list of action buttons
                          buttons: actions,
                          isVertical: true,
                          spacing: spacing ??
                              (isMobile
                                  ? spacer4
                                  : isTab
                                      ? spacer5
                                      : spacer6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
