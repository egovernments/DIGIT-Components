/*
DigitLocationFormInput` is a customizable formfield widget that  extends the baseforminput.

 Example usage:
 ```dart
 DigitLocationFormInput(
 controller: _textController,
 label: 'Username',
 innerLabel: 'Click on the icon to add your current location',
 charCount: true,
 helpText: 'This is a simple example of DigitLocationFormInput',
 onChange: (value) {
 print(value);
 },
 ),
 ....*/

import 'package:flutter/material.dart';
import '../../blocs/LocationBloc.dart';
import '../../utils/validators/validator.dart';
import 'digit_base_form_input.dart';

class DigitLocationFormInput extends BaseDigitFormInput {
  const DigitLocationFormInput({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? infoText,
    bool? info,
    bool readOnly = false,
    bool isDisabled = false,
    bool isRequired = false,
    String? initialValue,
    bool charCount = false,
    bool editable = false,
    String? innerLabel,
    String? helpText,
    TooltipTriggerMode triggerMode = TooltipTriggerMode.tap,
    bool preferToolTipBelow = false,
    IconData suffixIcon = Icons.my_location,
    void Function(String?)? onError,
    final List<Validator>? validations,
    final void Function(String)? onChange,
  }) : super(
          key: key,
          controller: controller,
          label: label,
          info: info,
          infoText: infoText,
          readOnly: readOnly,
          isDisabled: isDisabled,
          isRequired: isRequired,
          charCount: charCount,
          innerLabel: innerLabel,
          helpText: helpText,
          triggerMode: triggerMode,
          preferToolTipBelow: preferToolTipBelow,
          suffixIcon: suffixIcon,
          onError: onError,
          initialValue: initialValue,
          validations: validations,
          onChange: onChange,
          showCurser: editable,
          isEditable: editable,
        );

  @override
  _DigitLocationFormInputState createState() => _DigitLocationFormInputState();
}

class _DigitLocationFormInputState extends BaseDigitFormInputState {
  LocationBloc locationBloc = LocationBloc();

  @override
  void onSuffixIconClick({void Function()? customFunction}) async {
    await locationBloc.getCurrentLocation(widget.controller);
  }

  @override
  void onTap() async{
    await locationBloc.getCurrentLocation(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    /// You can customize the appearance or behavior specific to the TextFormInput here
    return super.build(context);
  }
}
