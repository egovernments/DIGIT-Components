import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/spacers.dart';

class DigitOTPInput extends StatefulWidget {
  /// TextField Controller
  final OtpFieldControllerV2? controller;

  /// Number of the OTP Fields
  final int length;

  /// Total Width of the OTP Text Field
  final double width;

  /// Width of the single OTP Field
  final double fieldWidth;

  /// space between the text fields
  final double spaceBetween;

  /// content padding of the text fields
  final EdgeInsets contentPadding;

  /// Manage the type of keyboard that shows up
  final TextInputType keyboardType;

  /// show the error border or not
  final bool hasError;

  final TextCapitalization textCapitalization;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// The style to use for the text being edited.
  final double outlineBorderRadius;


  /// Obscure Text if data is sensitive
  final bool obscureText;

  /// Whether the [InputDecorator.child] is part of a dense form (i.e., uses less vertical
  /// space).
  final bool isDense;

  /// Callback function, called when a change is detected to the pin.
  final ValueChanged<String>? onChanged;

  /// Callback function, called when pin is completed.
  final ValueChanged<String>? onCompleted;

  /// Change cursor color
  final Color? cursorColor;

  /// Change auto Focus on first field
  final bool autoFocus;

  final String? errorMessage;

  final String? label;

  /// Input Formatter
  final List<TextInputFormatter>? inputFormatter;

  const DigitOTPInput({
    Key? key,
    this.length = 4,
    this.width = 10,
    this.controller,
    this.fieldWidth = 30,
    this.spaceBetween = 0,
    this.hasError = false,
    this.keyboardType = TextInputType.number,
    this.style,
    this.outlineBorderRadius = 10,
    this.label,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.onChanged,
    this.errorMessage,
    this.inputFormatter,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    this.isDense = false,
    this.onCompleted,
    this.cursorColor,
    this.autoFocus = false,
  }) : assert(length > 1), super(key: key);

  @override
  DigitOTPInputState createState() => DigitOTPInputState();
}

class DigitOTPInputState extends State<DigitOTPInput> {
  late List<FocusNode?> _focusNodes;
  bool _hasError = false;
  late List<TextEditingController?> _textControllers;
  late List<String> _pin;
  int _focusedIndex = 0; // Track the currently focused index

  @override
  void initState() {
    super.initState();

    if (widget.hasError) {
      _hasError = true;
    }

    if (widget.controller != null) {
      widget.controller!.setOtpTextFieldState(this);
    }

    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.length, null, growable: false);

    _pin = List.generate(widget.length, (int i) => '');
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _moveFocus(-1);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _moveFocus(1);
          }
        }
      },
      child: SizedBox(
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(widget.label != null)
              ...[
                Text(
                  widget.label!,
                  style: textTheme.bodyL.copyWith(
                    color: theme.colorTheme.text.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16,),
              ],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(widget.length, (index) {
                return _buildTextField(context, index);
              }),
            ),
            if(widget.errorMessage != null && _hasError)
              ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: spacer1 / 2,
                        ),
                        SizedBox(
                          height: spacer4,
                          width: spacer4,
                          child: Icon(
                            Icons.info,
                            color: theme.colorTheme.alert.error,
                            size: spacer4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: spacer1),
                    Text(
                      widget.errorMessage!,
                      style: textTheme.bodyL.copyWith(
                        color: theme.colorTheme.alert.error,
                      ),
                    ),
                  ],
                ),
              ]
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, int index) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? textEditingController = _textControllers[index];

    if (focusNode == null) {
      _focusNodes[index] = FocusNode();
      focusNode = _focusNodes[index];
      focusNode?.addListener(() => handleFocusChange(index));
    }
    if (textEditingController == null) {
      _textControllers[index] = TextEditingController();
      textEditingController = _textControllers[index];
    }

    final isLast = index == widget.length - 1;

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(
        right: isLast ? 0 : 8,
      ),
      child: TextField(
        controller: _textControllers[index],
        maxLength: _textControllers[index]!= null && _textControllers[index]!.text.isEmpty ? null : 1,
        keyboardType: widget.keyboardType,
        cursorColor: widget.cursorColor,
        textCapitalization: widget.textCapitalization,
        textAlign: TextAlign.center,
        style: widget.style ?? textTheme.headingM.copyWith(color: theme.colorTheme.text.primary),
        inputFormatters: widget.inputFormatter,
        autofocus: index == 0 && widget.autoFocus,
        focusNode: _focusNodes[index],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          isDense: widget.isDense,
          counterText: "",
          contentPadding: widget.contentPadding,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: _hasError
                  ? theme.colorTheme.alert.error
                  : theme.colorTheme.generic.inputBorder,
              width: _hasError ? 1.5 : 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: theme.colorTheme.primary.primary1,
              width: 1.5,
            ),
          ),
        ),
        onChanged: (String str) {
          setState(() {
            _hasError = false;
          });

          if (str.length > 1) {
            _handlePaste(str);
            return;
          }

          if (_pin[index].isEmpty) {
            setState(() {
              _pin[index] = str;
            });
          }

          if (str.isNotEmpty && _pin[index].length == 1 && !isLast) {
            _focusNodes[index]!.unfocus();
          }

          if (str.isEmpty) {
            if (index > 0) {
              _focusNodes[index]!.unfocus();
              _focusNodes[index - 1]!.requestFocus();
            }
          } else if (index + 1 < widget.length) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }

          String currentPin = _getCurrentPin();
          if (!_pin.contains('') && currentPin.length == widget.length) {
            widget.onCompleted?.call(currentPin);
          }
          widget.onChanged?.call(currentPin);
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant DigitOTPInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void handleFocusChange(int index) {
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? controller = _textControllers[index];

    if (focusNode == null || controller == null) return;

    if (focusNode.hasFocus) {
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
      _focusedIndex = index; // Update focused index
    }
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (var value in _pin) {
      currentPin += value;
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    int firstEmptyIndex = _pin.indexWhere((value) => value.isEmpty);

    if (firstEmptyIndex == -1) return;

    int remainingFields = widget.length - firstEmptyIndex;

    if (str.length > remainingFields) {
      str = str.substring(0, remainingFields);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str[i];
      _textControllers[firstEmptyIndex + i]!.text = digit;
      _pin[firstEmptyIndex + i] = digit;
    }

    int lastFilledIndex = firstEmptyIndex + str.length - 1;

    if (lastFilledIndex < widget.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[lastFilledIndex + 1]);
    } else {
      FocusScope.of(context).unfocus();
    }

    String currentPin = _getCurrentPin();

    if (!_pin.contains('') && currentPin.length == widget.length) {
      widget.onCompleted?.call(currentPin);
    }

    widget.onChanged?.call(currentPin);
  }

  void _moveFocus(int direction) {
    int newIndex = _focusedIndex + direction;

    if (newIndex < 0) {
      newIndex = widget.length - 1;
    } else if (newIndex >= widget.length) {
      newIndex = 0;
    }

    if (_focusedIndex != newIndex) {
      FocusScope.of(context).requestFocus(_focusNodes[newIndex]);
      _focusedIndex = newIndex;
    }
  }
}

class OtpFieldControllerV2 {
  late DigitOTPInputState _otpTextFieldState;

  void setOtpTextFieldState(DigitOTPInputState state) {
    _otpTextFieldState = state;
  }

  void clear() {
    final textFieldLength = _otpTextFieldState.widget.length;
    _otpTextFieldState._pin = List.generate(textFieldLength, (int i) => '');

    final textControllers = _otpTextFieldState._textControllers;
    for (var textController in textControllers) {
      if (textController != null) {
        textController.text = '';
      }
    }

    final firstFocusNode = _otpTextFieldState._focusNodes[0];
    if (firstFocusNode != null) {
      FocusScope.of(_otpTextFieldState.context).requestFocus(firstFocusNode);
    }
  }

  String getOtpText() {
    return _otpTextFieldState._getCurrentPin();
  }

  void setOtpText(String text) {
    if (text.length > _otpTextFieldState.widget.length) {
      text = text.substring(0, _otpTextFieldState.widget.length);
    }

    _otpTextFieldState._pin = List.generate(_otpTextFieldState.widget.length, (index) {
      return index < text.length ? text[index] : '';
    });

    for (int i = 0; i < _otpTextFieldState._textControllers.length; i++) {
      _otpTextFieldState._textControllers[i]?.text = _otpTextFieldState._pin[i];
    }

    final lastIndex = text.length - 1;
    if (lastIndex >= 0 && lastIndex < _otpTextFieldState.widget.length) {
      FocusScope.of(_otpTextFieldState.context)
          .requestFocus(_otpTextFieldState._focusNodes[lastIndex]);
    }
  }
}