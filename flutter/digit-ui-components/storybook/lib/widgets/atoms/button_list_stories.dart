import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/helper_widget/button_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import '../../plugins/code_view_wrapper.dart';

List<Story> digitButtonListStories() {
  return [
    Story(
      name: 'Atom/Button List/default',
      builder: (context) {

        return DigitButtonListTile(
          buttons: [
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
          ],
        );
      },
    ),
    Story(
      name: 'Atom/Button List/start',
      builder: (context) {

        return DigitButtonListTile(
          alignment: MainAxisAlignment.start,
          buttons: [
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
          ],
        );
      },
    ),
    Story(
      name: 'Atom/DigitButton List/end',
      builder: (context) {

        return DigitButtonListTile(
          alignment: MainAxisAlignment.end,
          buttons: [
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
          ],
        );
      },
    ),
    Story(
      name: 'Atom/DigitButton List/space between',
      builder: (context) {

        return DigitButtonListTile(
          alignment: MainAxisAlignment.spaceBetween,
          sortDigitButtons: context.knobs.boolean(label: 'Sorted', initial: false),
          isVertical: context.knobs.boolean(label: 'Vertical', initial: false),
          buttons: [
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Secondary', onPressed: () {}, type: DigitButtonType.secondary, size: DigitButtonSize.large),
            DigitButton(label: 'Tertiary', onPressed: () {}, type: DigitButtonType.tertiary, size: DigitButtonSize.large),
            DigitButton(label: 'Link', onPressed: () {}, type: DigitButtonType.link, size: DigitButtonSize.large),
            DigitButton(label: 'Primary', onPressed: () {}, type: DigitButtonType.primary, size: DigitButtonSize.large),
            DigitButton(label: 'Secondary', onPressed: () {}, type: DigitButtonType.secondary, size: DigitButtonSize.large),
          ],
        );
      },
    ),
  ];
}
