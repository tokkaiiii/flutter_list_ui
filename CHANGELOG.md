# Changelog

## 1.3.3
- Added example with long text support in InfoList
- Improved documentation for horizontal scrolling text
- Updated example app to demonstrate text overflow handling

## 1.3.2
- Fixed InfoHeader widget to support icon parameter
- Improved UI consistency between sliver and non-sliver modes
- Added proper error handling for missing parameters

## 1.3.1
- Added support for horizontal scrolling in InfoList items
- Improved text overflow handling in InfoHeader
- Enhanced documentation with examples

## 1.3.0
- Added sliver mode support for InfoCard and InfoList
- Improved performance with const constructors
- Enhanced documentation with sliver examples

## 1.2.0
- Added Info widget for consistent styling
- Improved theme support
- Enhanced documentation

## 1.1.0
- Added InfoCard widget
- Improved InfoHeader widget
- Enhanced documentation

## 1.0.0
- Initial release
- Added InfoList widget
- Added InfoHeader widget
- Added InfoItem model

## 1.3.2

* Improved UI consistency between sliver and non-sliver modes in InfoList
* Enhanced horizontal scrolling for long text in list items
* Fixed layout issues in sliver mode
* Updated example to demonstrate improved sliver functionality

## 1.3.1

* Added `useSliver` parameter to `InfoList` and `InfoCard` for better scroll performance
* Added `itemPadding` and `itemDecoration` parameters to `CustomInfoList`
* Added new example styles: Compact List and Card Style List
* Added support for horizontal scrolling in sliver mode
* Fixed infinite width constraint issue in sliver mode
* Fixed layout issues with `ListTile` in sliver mode
* Improved layout handling in sliver mode
* Enhanced example code with more diverse list styles
* Updated documentation with new features

## 1.3.0

* Added `buildEmptyItem` parameter to `InfoList` for custom empty state UI
* Improved documentation with more examples and detailed property descriptions
* Added shimmer effect example for skeleton loading UI
* Updated dependencies to latest versions


### Added
- Added `InfoCard` widget with header and body support
- Added `InfoHeader` widget for consistent header styling
- Added support for custom item builders
- Added support for empty state handling

### Changed
- Improved documentation
- Enhanced example code


### Added
- Initial release
- Basic `InfoList` widget implementation
- Support for custom item types
- Basic example implementation

## 1.2.8

- Updated image URL in README.md to use GitHub Issues image URL for better compatibility

## 1.2.7

- Fixed image URL in README.md to display correctly on GitHub and pub.dev

## 1.2.6

- Fixed image display issues in README.md for both GitHub and pub.dev
- Updated image path to use absolute URL for better compatibility

## 1.2.5

- Fixed image display issues in README.md
- Improved documentation and examples
- Updated package description

## 1.2.4
- Fixed code formatting issues
- Improved documentation and examples
- Removed unused file (info_ui_package.dart)
- Updated package name references

## 1.2.3
- Updated package documentation and examples
- Fixed image display in README.md
- Improved code formatting and structure

## 1.2.2
- Added support for custom item decorations
- Improved error handling in AsyncValue support
- Added new example with InfoCard usage

## 1.2.1
- Initial release
- Basic InfoList widget implementation
- AsyncValue support for loading and error states
- InfoCard and InfoHeader components

## 1.2.0

* Fix: Update InfoHeader to extend InfoHeaderBase
* Doc: Add Riverpod installation guide to README
* Doc: Update examples to use new InfoHeader API

## 1.1.4

* Fix: Revert InfoHeader to concrete class and add InfoHeaderBase interface
* Fix: Update InfoCard and InfoCardWithRiverpod to use InfoHeaderBase
* Fix: Update example to use InfoHeader

## 1.1.3

* Fix: Update example to use StandardInfoHeader instead of InfoHeader

## 1.1.2

* Fix: Make InfoHeader.standard factory constructor parameters match StandardInfoHeader
* Fix: Add @override annotation to build method
* Fix: Make padding parameter nullable in StandardInfoHeader

## 1.1.1

* Fix: Remove default values from factory constructor in InfoHeader
* Fix: Make InfoHeader constructors const
* Fix: Remove showBottomBorder from InfoHeader (now always shows border)

## 1.1.0

BREAKING CHANGES:
* Converted InfoHeader to an abstract class for better customization
* Moved existing implementation to StandardInfoHeader
* Added InfoHeader.standard factory constructor
* Improved documentation with examples

## 1.0.7
- Added border control options to InfoCard and InfoCardWithRiverpod
- Added showBorder property to control border visibility
- Added borderColor property to customize border color
- Improved documentation for border customization

## 1.0.6
- Improved border radius handling in InfoCard
- Fixed header styling with rounded corners
- Updated flutter_riverpod to version 2.5.1
- Removed unnecessary Container widgets for better performance
- Enhanced documentation for padding options

## 1.0.5
- Initial release with basic functionality
- Added Info and InfoCard widgets
- Added InfoHeader component
- Added InfoList component
- Added Riverpod integration

## 1.0.4
- Initial release with basic functionality
- Added Info and InfoCard widgets
- Added InfoHeader component
- Added InfoList component
- Added Riverpod integration

## 1.0.3
- Added single import support for all components
- Improved documentation with import examples
- Enhanced package structure

## 1.0.2
- Fixed layout issues in InfoList widget
- Improved documentation and examples
- Enhanced error handling

## 1.0.1
- Added generic type support for `Info` and `InfoCard` widgets
- Improved Material 3 design system integration
- Added customizable styles for headers and list items
- Enhanced documentation and examples
- Fixed file naming to follow Dart style guide
- Added shadow effects to cards
- Improved padding and margin customization options

## 1.0.0

### Added
- Initial release of info_ui_package
- InfoList widget with AsyncValue support
- InfoCard widget for consistent card layouts
- InfoHeader widget for card headers
- Support for customizable styling and layouts
- Example documentation with screenshots

### Features
- Flexible list widget that can display any type of data
- Built-in support for AsyncValue data handling
- Customizable styling options
- Modern design with Material You support
- Comprehensive documentation and examples

### Dependencies
- flutter_screenutil: ^5.9.0
- google_fonts: ^6.1.0
- cached_network_image: ^3.3.1
- flutter_riverpod: ^2.5.1

* Added InfoCard widget
* Added InfoHeader widget
* Added InfoList widget
* Added Info widget

## 0.0.2

* Added support for sliver mode in InfoList widget
* Improved UI consistency between sliver and non-sliver modes
* Enhanced horizontal scrolling for long text in list items
* Updated example to demonstrate sliver functionality

## 0.0.1

* Initial release
