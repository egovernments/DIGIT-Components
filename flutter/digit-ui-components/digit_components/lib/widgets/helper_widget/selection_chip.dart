import 'package:digit_ui_components/constants/app_constants.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class SelectionChip<T> extends StatelessWidget {
  final String label;
  final VoidCallback onItemDelete;
  final bool capitalizedFirstLetter;
  final String? errorMessage;

  const SelectionChip({
    Key? key,
    required this.label,
    required this.onItemDelete,
    this.capitalizedFirstLetter = true,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Capitalize the first letter if required
    String capitalizeFirstLetter(String text) {
      if (text.isNotEmpty && capitalizedFirstLetter) {
        return text.substring(0, 1).toUpperCase() + text.substring(1);
      }
      return text;
    }

    DigitTypography currentTypography = getTypography(context, false);

    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: spacer2,
              vertical: spacer2,
            ),
            decoration: BoxDecoration(
              boxShadow: errorMessage != null
                  ? [
                      BoxShadow(
                        color: const DigitColors()
                            .light
                            .alertError
                            .withOpacity(.30),
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                        blurRadius: 4,
                      ),
                    ]
                  : [],
              border: Border.all(
                color: errorMessage != null
                    ? const DigitColors().light.alertError
                    : const DigitColors().light.genericDivider,
                width: Common.defaultBorderWidth,
              ),
              borderRadius: BorderRadius.circular(spacer1),
              color: errorMessage != null
                  ? const DigitColors().light.paperPrimary
                  : const DigitColors().light.genericBackground,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    capitalizeFirstLetter(label),
                    style: errorMessage != null
                        ? currentTypography.headingS.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: const DigitColors().light.alertError,
                          )
                        : currentTypography.bodyS.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: const DigitColors().light.textPrimary,
                          ),
                  ),
                ),
                const SizedBox(
                  width: spacer2,
                ),
                InkWell(
                  onTap: onItemDelete,
                  hoverColor: const DigitColors().transparent,
                  splashColor: const DigitColors().transparent,
                  highlightColor: const DigitColors().transparent,
                  child: Container(
                    width: spacer6,
                    height: spacer6,
                    decoration: BoxDecoration(
                      color: errorMessage != null
                          ? const DigitColors().light.alertError
                          : const DigitColors().light.textSecondary,
                      borderRadius: BorderRadius.circular(spacer1),
                    ),
                    child: Icon(
                      Icons.close,
                      size: spacer6,
                      color: const DigitColors().light.paperPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (errorMessage != null)
            const SizedBox(
              height: spacer1,
            ),
          if (errorMessage != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: spacer1 / 2,
                    ),
                    Icon(
                      Icons.info,
                      color: const DigitColors().light.alertError,
                      size: spacer4,
                    ),
                  ],
                ),
                const SizedBox(width: spacer1),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    errorMessage!.length > 256
                        ? '${capitalizeFirstLetter(errorMessage!).substring(0, 256)}...'
                        : capitalizeFirstLetter(errorMessage!),
                    style: currentTypography.bodyS.copyWith(
                      color: const DigitColors().light.alertError,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
