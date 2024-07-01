import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../constants/AppView.dart';
import '../../models/DropdownModels.dart';
import '../helper_widget/overlay_dropdown.dart';

class DigitFooter extends StatefulWidget {
  final List<FooterAction> actions;
  final double? actionSpacing;
  final MainAxisAlignment? actionAlignment;
  final bool? inlineAction;

  const DigitFooter({
    Key? key,
    required this.actions,
    this.actionSpacing,
    this.actionAlignment,
    this.inlineAction,
  }) : super(key: key);

  @override
  _DigitFooterState createState() => _DigitFooterState();
}

class _DigitFooterState extends State<DigitFooter> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    bool isTab = AppView.isTabletView(MediaQuery.of(context).size);
    bool isDesktop = AppView.isDesktopView(MediaQuery.of(context).size);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile
              ? 16
              : isTab
                  ? 20
                  : 24,
          vertical: 16),
      decoration: BoxDecoration(
        color: const DigitColors().light.paperPrimary,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(.15),
            offset: const Offset(0, -1),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      ),
      child: widget.inlineAction == true
          ? _buildHorizontalActions(context)
          : isMobile
              ? _buildVerticalActions(context)
              : _buildHorizontalActions(context),
    );
  }

  Widget _buildVerticalActions(BuildContext context) {
    List<FooterAction> sortedActions = List.from(widget.actions);

    final bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    final bool isTab = AppView.isTabletView(MediaQuery.of(context).size);

    // Sort actions to have primary buttons at the top
    sortedActions.sort((a, b) {
      if (a.button.type == ButtonType.primary &&
          b.button.type != ButtonType.primary) {
        return -1;
      } else if (a.button.type != ButtonType.primary &&
          b.button.type == ButtonType.primary) {
        return 1;
      } else {
        return 0;
      }
    });

    List<Widget> actionWidgets = [];

    for (int i = 0; i < sortedActions.length; i++) {
      actionWidgets.add(
        sortedActions[i].dropdownItems != null
            ? OverlayDropdown(
                type: OverlayDropdownType.footer,
                items: sortedActions[i].dropdownItems!,
                title: Button(
                  label: sortedActions[i].button.label,
                  size: sortedActions[i].button.size,
                  type: sortedActions[i].button.type,
                  onPressed: sortedActions[i].button.onPressed,
                  prefixIcon: sortedActions[i].button.prefixIcon,
                  suffixIcon: sortedActions[i].button.suffixIcon,
                  mainAxisSize: MainAxisSize.max,
                ),
                onChange: (selectedItem) {
                  if (sortedActions[i].onDropdownItemSelected != null) {
                    sortedActions[i].onDropdownItemSelected!(selectedItem);
                  }
                },
              )
            : sortedActions[i].button,
      );

      // Add a gap of 16 pixels between items
      if (i < sortedActions.length - 1) {
        actionWidgets.add(SizedBox(height: widget.actionSpacing ?? (isMobile ? 16.0 : isTab ? 20 : 24)));
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actionWidgets,
    );
  }

  Widget _buildHorizontalActions(BuildContext context) {
    List<Widget> actionWidgets = [];

    final bool isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    final bool isTab = AppView.isTabletView(MediaQuery.of(context).size);

    for (int i = 0; i < widget.actions.length; i++) {
      actionWidgets.add(
        widget.actions[i].dropdownItems != null
            ? OverlayDropdown(
                type: OverlayDropdownType.footer,
                items: widget.actions[i].dropdownItems!,
                title: widget.actions[i].button,
                onChange: (selectedItem) {
                  if (widget.actions[i].onDropdownItemSelected != null) {
                    widget.actions[i].onDropdownItemSelected!(selectedItem);
                  }
                },
              )
            : widget.actions[i].button,
      );

      // Add a gap of 16 pixels between items
      if (i < widget.actions.length - 1) {
        actionWidgets.add(SizedBox(width: widget.actionSpacing ?? (isMobile ? 16.0 : isTab ? 20 : 24)));
      }
    }

    return Row(
      mainAxisAlignment:
          widget.actionAlignment ?? MainAxisAlignment.spaceBetween,
      children: actionWidgets,
    );
  }
}

class FooterAction {
  final Button button;
  final List<DropdownItem>? dropdownItems;
  final void Function(DropdownItem)? onDropdownItemSelected;

  FooterAction({
    required this.button,
    this.dropdownItems,
    this.onDropdownItemSelected,
  });
}
