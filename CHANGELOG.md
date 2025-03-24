# Changelog

## 1.1.3

* Fix: Revert InfoHeader to concrete class and add InfoHeaderBase interface
* Fix: Update InfoCard and InfoCardWithRiverpod to use InfoHeaderBase
* Fix: Update example to use InfoHeader

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
- Initial release
- Basic info card system with header and list components
- Riverpod integration for state management
- Basic customization options for colors and padding

### Features
- Customizable list components
- Card layouts with headers
- Responsive design support
- Example application included
- Modern UI design patterns

### Dependencies
- flutter_screenutil: ^5.9.0
- google_fonts: ^6.1.0
- cached_network_image: ^3.3.1
- flutter_riverpod: ^2.5.1

* Added InfoCard widget
* Added InfoHeader widget
* Added InfoList widget
* Added Info widget
