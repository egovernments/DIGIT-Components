import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';

List<Story> headerMoleculeStories() {
  String city = 'City';
  String langauge = 'Language';
  return [
    Story(
      name: 'Molecule/Header/light/1',
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeaderMolecule(
              title: 'My Custom Header',
              type: HeaderType.light,
              trailingDigitLogo: true,
              leadingDigitLogo: false,
              actions: [
                HeaderAction(
                  widget: Row(
                    children: [
                      Text(city),
                      const SizedBox(width: 8,),
                      Icon(Icons.arrow_drop_down, color: const DigitColors().light.textPrimary,)
                    ],
                  ),
                  dropdownItems: [
                    const DropdownItem(code: '1', name: 'Option 1'),
                    const DropdownItem(code: '2', name: 'Option 2'),
                    const DropdownItem(code: '3', name: 'Option 3'),
                    const DropdownItem(code: '4', name: 'Option 4'),
                  ],
                ),
                HeaderAction(
                  widget: Row(
                    children: [
                      const Text('Language'),
                      const SizedBox(width: 8,),
                      Icon(Icons.arrow_drop_down, color: const DigitColors().light.textPrimary,)
                    ],
                  ),
                  dropdownItems: [
                    const DropdownItem(code: '1', name: 'Hindi'),
                    const DropdownItem(code: '2', name: 'English'),
                    const DropdownItem(code: '3', name: 'French'),
                  ],
                ),
                HeaderAction(
                  widget: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                      Border.all(color: DigitColors().light.primary2, width: 1.0),
                      color: DigitColors().light.primary2,
                    ),
                    child: Center(
                      child: Text(
                        'R',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: DigitColors().light.paperPrimary),
                      ),
                    ),
                  ),
                  dropdownItems: [
                    const DropdownItem(code: '1', name: 'Hindi'),
                    const DropdownItem(code: '2', name: 'English'),
                    const DropdownItem(code: '3', name: 'French'),
                  ],
                ),
              ],
            ),
          ],
        );
      }),
    ),
    Story(
      name: 'Molecule/Header/light/2',
      builder: (context) => const CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.light,
        // leadingWidget: Image.network(
        //   'https://s3-alpha-sig.figma.com/img/1d0d/d20b/17bba4d1a5b09a0840e516227bbe9364?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kCzBVvYwPETCwHpSAAaIFB1MZQisvQ1avryik4YbCCH0HDVfJp1dxdl8UNPrDgf34YYKgyA~nNbNeGJ8N9eurZz3JbjCzdLdJiGnJL9ANqQgAOdZV4c9TAroinpq9RhTdTOjJg2U4f00PCM8jYTErO2WvNGAlXx~SqSBIj~SuiwYR2Xf2mozObFIDAjyW2gyDa6HbVLPkdINrnDJnm73S3HrqdL3q6DZkYEmEYd7qtZW0XJ3ywZBbXEuRnhumX6Ylf9RTzLdJqlfP5WaQDwjdxhQTNmIUjBYMqaF-SWqR31gZWISkKjK3uXdtfjAQBW2CYzMu-n~Alh9FwD3dx-SZQ__',
        //   fit: BoxFit.fill,
        // ),
        trailingDigitLogo: false,
        leadingDigitLogo: true,
      ),
    ),
    Story(
      name: 'Molecule/Header/light/3',
      builder: (context) => const CustomHeaderMolecule(
        title: 'My Custom Header',
        actions: [],
        type: HeaderType.light,
      ),
    ),
    Story(
      name: 'Molecule/Header/light/4',
      builder: (context) =>  CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.light,
        leadingDigitLogo: false,
        leadingWidget: const Icon(
          Icons.menu,
          size: 24,
        ),
        trailingDigitLogo: false,
        actions: [
          HeaderAction(
            widget: Row(
              children: [
                Text(city),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.textPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Option 1'),
              const DropdownItem(code: '2', name: 'Option 2'),
              const DropdownItem(code: '3', name: 'Option 3'),
              const DropdownItem(code: '4', name: 'Option 4'),
            ],
          ),
        ],
      ),
    ),
    Story(
      name: 'Molecule/Header/light/5',
      builder: (context) => CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.light,
        leadingDigitLogo: false,
        trailingDigitLogo: true,
        actions: [
          HeaderAction(
            widget: Row(
              children: [
                Text(city),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.textPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Option 1'),
              const DropdownItem(code: '2', name: 'Option 2'),
              const DropdownItem(code: '3', name: 'Option 3'),
              const DropdownItem(code: '4', name: 'Option 4'),
            ],
          ),
          HeaderAction(
            widget: Row(
              children: [
                const Text('Language'),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.textPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),
          HeaderAction(
            widget: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                Border.all(color: DigitColors().light.primary2, width: 1.0),
                color: DigitColors().light.primary2,
              ),
              child: Center(
                child: Text(
                  'R',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: DigitColors().light.paperPrimary),
                ),
              ),
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),

        ],
      ),
    ),
    Story(
      name: 'Molecule/Header/dark/1',
      builder: (context) => const CustomHeaderMolecule(
        title: 'My Custom Header',
        actions: [],
        type: HeaderType.dark,
      ),
    ),
    Story(
      name: 'Molecule/Header/dark/2',
      builder: (context) => const CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.dark,
        // leadingWidget: Image.network(
        //   'https://s3-alpha-sig.figma.com/img/1d0d/d20b/17bba4d1a5b09a0840e516227bbe9364?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kCzBVvYwPETCwHpSAAaIFB1MZQisvQ1avryik4YbCCH0HDVfJp1dxdl8UNPrDgf34YYKgyA~nNbNeGJ8N9eurZz3JbjCzdLdJiGnJL9ANqQgAOdZV4c9TAroinpq9RhTdTOjJg2U4f00PCM8jYTErO2WvNGAlXx~SqSBIj~SuiwYR2Xf2mozObFIDAjyW2gyDa6HbVLPkdINrnDJnm73S3HrqdL3q6DZkYEmEYd7qtZW0XJ3ywZBbXEuRnhumX6Ylf9RTzLdJqlfP5WaQDwjdxhQTNmIUjBYMqaF-SWqR31gZWISkKjK3uXdtfjAQBW2CYzMu-n~Alh9FwD3dx-SZQ__',
        //   fit: BoxFit.fill,
        // ),
        trailingDigitLogo: false,
        leadingDigitLogo: true,
      ),
    ),
    Story(
      name: 'Molecule/Header/dark/3',
      builder: (context) =>  CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.dark,
        actions: [
          HeaderAction(
            widget: Row(
              children: [
                Text(city, style: TextStyle(color: const DigitColors().light.paperPrimary),),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.paperPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Option 1'),
              const DropdownItem(code: '2', name: 'Option 2'),
              const DropdownItem(code: '3', name: 'Option 3'),
              const DropdownItem(code: '4', name: 'Option 4'),
            ],
          ),
          HeaderAction(
            widget: Row(
              children: [
                Text('Language', style: TextStyle(color: const DigitColors().light.paperPrimary),),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.paperPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),
        ],
      ),
    ),
    Story(
      name: 'Molecule/Header/dark/4',
      builder: (context) => CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.dark,
        leadingDigitLogo: false,
        leadingWidget: Icon(
          Icons.menu,
          size: 24,
          color: const DigitColors().light.paperPrimary,
        ),
        trailingDigitLogo: false,
        actions:  [
          HeaderAction(
            widget: Row(
              children: [
                Text('Language', style: TextStyle(color: const DigitColors().light.paperPrimary),),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.paperPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),
        ],
      ),
    ),
    Story(
      name: 'Molecule/Header/dark/5',
      builder: (context) => CustomHeaderMolecule(
        title: 'My Custom Header',
        type: HeaderType.dark,
        leadingDigitLogo: false,
        trailingDigitLogo: true,
        actions: [
          HeaderAction(
            widget: Row(
              children: [
                Text(city, style: TextStyle(color: const DigitColors().light.paperPrimary),),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.paperPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Option 1'),
              const DropdownItem(code: '2', name: 'Option 2'),
              const DropdownItem(code: '3', name: 'Option 3'),
              const DropdownItem(code: '4', name: 'Option 4'),
            ],
          ),
          HeaderAction(
            widget: Row(
              children: [
                Text('Language', style: TextStyle(color: const DigitColors().light.paperPrimary),),
                const SizedBox(width: 8,),
                Icon(Icons.arrow_drop_down, color: const DigitColors().light.paperPrimary,)
              ],
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),
          HeaderAction(
            widget: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: const DigitColors().light.paperPrimary, width: 1.0),
                color: const DigitColors().light.paperPrimary,
              ),
              child: Center(
                child: Text(
                  'R',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: const DigitColors().light.primary2),
                ),
              ),
            ),
            dropdownItems: [
              const DropdownItem(code: '1', name: 'Hindi'),
              const DropdownItem(code: '2', name: 'English'),
              const DropdownItem(code: '3', name: 'French'),
            ],
          ),
        ],
      ),
    ),
  ];
}