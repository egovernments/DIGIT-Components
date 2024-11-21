import 'package:digit_ui_components/models/privacy_notice/privacy_notice_model.dart';
import 'package:digit_ui_components/widgets/privacy_notice/privacy_component.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';
import 'package:reactive_forms/reactive_forms.dart'; // Import reactive forms
import '../../iframe/iframe_widget.dart';

List<Story> privacyComponentStories() {
  return [
    Story(
      name: 'Digit Privacy Component/basic',
      builder: (context) {
        // Define the reactive form
        final form = FormGroup({
          'privacyCheck': FormControl<bool>(value: false),
        });

        final privacyPolicy =  {
          "header": "PRIVACY_HEADER",
          "module": "HCM",
          "active": true,
          "contents": [
            {
              "header": "PRIVACY_HEADER_1_SUB_1",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_3",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_4",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_5",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_6",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_1_SUB_1_DESC_7",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_2_SUB_2",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_2_SUB_2_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_2_SUB_2_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_2_SUB_2_DESC_3",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_2_SUB_2_DESC_4",
                  "type": null,
                  "isBold": false,
                  "subDescriptions": [
                    {
                      "text": "PRIVACY_HEADER_2_SUB_2_DESC_3_SUBDESC_1",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_2_SUB_2_DESC_3_SUBDESC_2",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                },
                {
                  "text": "PRIVACY_HEADER_2_SUB_2_DESC_5",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_3_SUB_3",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_3_SUB_3_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_3_SUB_3_DESC_2",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_4_SUB_4",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_4_SUB_4_DESC_1",
                  "type": null,
                  "isBold": false,
                  "subDescriptions": [
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_1",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_2",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_3",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_4",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_5",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_6",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_7",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                },
                {
                  "text": "PRIVACY_HEADER_4_SUB_4_DESC_2",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_5_SUB_5",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_5_SUB_5_DESC_1",
                  "type": null,
                  "isBold": false,
                  "subDescriptions": [
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_1",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_2",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_3",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_4",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_5",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_6",
                      "type": "points",
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_6_SUB_1",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_6_SUB_6_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_6_SUB_6_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_6_SUB_6_DESC_3",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_6_SUB_6_DESC_4",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_7_SUB_1",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_7_SUB_7_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_7_SUB_7_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_7_SUB_7_DESC_3",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_7_SUB_7_DESC_4",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_8_SUB_1",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_8_SUB_8_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_8_SUB_8_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_8_SUB_8_DESC_3",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_8_SUB_8_DESC_4",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_9_SUB_9",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_9_SUB_9_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_9_SUB_9_DESC_2",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_9_SUB_9_DESC_3",
                  "type": null,
                  "isBold": false,
                  "subDescriptions": [
                    {
                      "text": "PRIVACY_HEADER_9_SUB_9_DESC_3_SUBDESC_1",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_9_SUB_9_DESC_3_SUBDESC_2",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                },
                {
                  "text": "PRIVACY_HEADER_9_SUB_9_DESC_4",
                  "type": null,
                  "isBold": false,
                  "subDescriptions": [
                    {
                      "text": "PRIVACY_HEADER_9_SUB_9_DESC_4_SUBDESC_1",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                },

                {
                  "text": "PRIVACY_HEADER_9_SUB_9_DESC_5",
                  "type": null,
                  "isBold": false,
                  "subDescriptions":[
                    {
                      "text": "PRIVACY_HEADER_9_SUB_9_DESC_5_SUBDESC_1",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    },
                    {
                      "text": "PRIVACY_HEADER_9_SUB_9_DESC_5_SUBDESC_2",
                      "type": null,
                      "isBold": false,
                      "isSpaceRequired": true
                    }
                  ]
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_10_SUB_10",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_10_SUB_10_DESC_1",
                  "type": null,
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_10_SUB_10_DESC_2",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_11_SUB_11",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_11_SUB_11_DESC_1",
                  "type": null,
                  "isBold": false
                }
              ]
            },
            {
              "header": "PRIVACY_HEADER_12_SUB_12",
              "descriptions": [
                {
                  "text": "PRIVACY_HEADER_12_SUB_12_DESC_1",
                  "type": "step",
                  "isBold": false
                },
                {
                  "text": "PRIVACY_HEADER_12_SUB_12_DESC_2",
                  "type": "step",
                  "isBold": false
                }
              ]
            }
          ]
        };


        final privacyPolicyModel = PrivacyNoticeModel.fromJson(privacyPolicy as Map<String, dynamic>);

        return ReactiveForm(
          formGroup: form,
          child: PrivacyComponent(
            privacyPolicy: privacyPolicyModel,
            formControlName: 'privacyCheck', // Pass the form control name
            text: 'this is privacy policy',
            linkText: 'click here to know more',
            validationMessage: 'Please accept the privacy policy',
          ),
        );
      },
    ),
  ];
}


