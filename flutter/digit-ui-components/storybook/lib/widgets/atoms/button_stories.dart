import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_theme_wrapper.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../plugins/code_view_wrapper.dart';

List<Story> DigitButtonStories() {
  return [
    Story(
      name: 'Atom/Buttons/Primary',
      wrapperBuilder: (context, child) => DigitThemeWrapper(
        child: child ?? Container(),
      ),
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CodeViewProvider.of(context)?.updateCodeString('''
DigitButton(
  label: 'Primary DigitButton',
  onPressed: () {},
  type: DigitButtonType.primary,
  isDisabled: false,
  size: DigitButtonSize.large,
)
          ''');
        });

        return DigitButton(
          label: context.knobs.text(label: 'Label', initial: 'Primary DigitButton'),
          onPressed: () {},
          type: DigitButtonType.primary,
          isDisabled: context.knobs.boolean(
            label: 'disable',
            initial: false,
          ),
          size: context.knobs.options(
            label: 'Size of DigitButton',
            initial: DigitButtonSize.large,
            options: const [
              Option(label: 'Small', value: DigitButtonSize.small),
              Option(label: 'Medium', value: DigitButtonSize.medium),
              Option(label: 'Large', value: DigitButtonSize.large),
            ],
          ),
          suffixIcon: context.knobs.nullable.options(
              label: 'Suffix Icon',
              initial: Icons.arrow_forward,
              enabled: false,
              options: [
                const Option(label: 'Arrow', value: Icons.arrow_forward),
                const Option(label: 'Home', value: Icons.home),
                const Option(label: 'Article', value: Icons.article),
                const Option(label: 'Location', value: Icons.my_location)
              ]),
          prefixIcon: context.knobs.nullable.options(
              label: 'Prefix Icon',
              initial: Icons.arrow_back,
              enabled: false,
              options: [
                const Option(label: 'Arrow', value: Icons.arrow_back),
                const Option(label: 'Home', value: Icons.home),
                const Option(label: 'Article', value: Icons.article),
                const Option(label: 'Location', value: Icons.my_location)
              ]),
        );
      },
    ),
    Story(
        name: 'Atom/Buttons/Secondary',
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CodeViewProvider.of(context)?.updateCodeString('''
DigitButton(
  label: 'Secondary DigitButton',
  onPressed: () {},
  type: DigitButtonType.secondary,
  isDisabled: false,
  size: DigitButtonSize.large,
)
          ''');
          });
          return DigitButton(
            label:
                context.knobs.text(label: 'Label', initial: 'Secondary DigitButton'),
            onPressed: () {
              // Add your secondary DigitButton logic here
            },
            isDisabled: context.knobs.boolean(
              label: 'disable',
              initial: false,
            ),
            type: DigitButtonType.secondary,
            size: context.knobs.options(
              label: 'Size of DigitButton',
              initial: DigitButtonSize.large,
              options: const [
                Option(
                  label: 'Small',
                  value: DigitButtonSize.small,
                ),
                Option(
                  label: 'Medium',
                  value: DigitButtonSize.medium,
                ),
                Option(
                  label: 'Large',
                  value: DigitButtonSize.large,
                ),
              ],
            ),
            suffixIcon: context.knobs.nullable.options(
                label: 'Suffix Icon',
                initial: Icons.arrow_forward,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_forward),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
            prefixIcon: context.knobs.nullable.options(
                label: 'Prefix Icon',
                initial: Icons.arrow_back,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_back),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
          );
        }),
    Story(
        name: 'Atom/Buttons/Tertiary',
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CodeViewProvider.of(context)?.updateCodeString('''
DigitButton(
  label: 'Tertiary DigitButton',
  onPressed: () {},
  type: DigitButtonType.tertiary,
  isDisabled: false,
  size: DigitButtonSize.large,
)
          ''');
          });
          return DigitButton(
            label:
                context.knobs.text(label: 'Label', initial: 'Tertiary DigitButton'),
            onPressed: () {
              // Add your secondary DigitButton logic here
            },
            isDisabled: context.knobs.boolean(
              label: 'disable',
              initial: false,
            ),
            type: DigitButtonType.tertiary,
            size: context.knobs.options(
              label: 'Size of DigitButton',
              initial: DigitButtonSize.large,
              options: const [
                Option(
                  label: 'Small',
                  value: DigitButtonSize.small,
                ),
                Option(
                  label: 'Medium',
                  value: DigitButtonSize.medium,
                ),
                Option(
                  label: 'Large',
                  value: DigitButtonSize.large,
                ),
              ],
            ),
            suffixIcon: context.knobs.nullable.options(
                label: 'Suffix Icon',
                initial: Icons.arrow_forward,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_forward),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
            prefixIcon: context.knobs.nullable.options(
                label: 'Prefix Icon',
                initial: Icons.arrow_back,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_back),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
          );
        }),
    Story(
        name: 'Atom/Buttons/Link',
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CodeViewProvider.of(context)?.updateCodeString('''
DigitButton(
  label: 'link',
  onPressed: () {},
  type: DigitButtonType.link,
  isDisabled: false,
  size: DigitButtonSize.large,
)
          ''');
          });
          return DigitButton(
            label: context.knobs.text(label: 'Label', initial: 'link'),
            onPressed: () {
              // Add your secondary DigitButton logic here
            },
            isDisabled: context.knobs.boolean(
              label: 'disable',
              initial: false,
            ),
            type: DigitButtonType.link,
            size: context.knobs.options(
              label: 'Size of DigitButton',
              initial: DigitButtonSize.large,
              options: const [
                Option(
                  label: 'Small',
                  value: DigitButtonSize.small,
                ),
                Option(
                  label: 'Medium',
                  value: DigitButtonSize.medium,
                ),
                Option(
                  label: 'Large',
                  value: DigitButtonSize.large,
                ),
              ],
            ),
            suffixIcon: context.knobs.nullable.options(
                label: 'Suffix Icon',
                initial: Icons.arrow_forward,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_forward),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
            prefixIcon: context.knobs.nullable.options(
                label: 'Prefix Icon',
                initial: Icons.arrow_back,
                enabled: false,
                options: [
                  const Option(label: 'Arrow', value: Icons.arrow_back),
                  const Option(label: 'Home', value: Icons.home),
                  const Option(label: 'Article', value: Icons.article),
                  const Option(label: 'Location', value: Icons.my_location)
                ]),
          );
        }),
  ];
}
