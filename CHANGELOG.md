# Changelog

## 1.4.4

* Added ScrollController support to InfoList widget
* Enhanced scroll control functionality
* Improved list interaction capabilities

## 1.4.3

* Updated README.md with detailed documentation
* Fixed example image URL
* Improved package documentation structure
* Enhanced code examples and usage guides
* Added comprehensive widget property documentation
* Updated dependencies section with version information

## 1.4.2

* Added example images to showcase package features
* Improved README.md with better visual documentation
* Enhanced package discoverability with example screenshots
* Updated documentation with visual examples

## 1.4.1

* Fixed repository URL for pub.dev verification
* Added search hashtags to package description
* Added example images to README.md
* Improved package documentation with better search keywords
* Enhanced pub.dev compatibility and discoverability
* Added comprehensive feature list in README.md
* Optimized package metadata for better search results

## 1.4.0

* Improved Windows compatibility
* Removed unused assets configuration
* Added comprehensive Windows troubleshooting guide
* Enhanced documentation for cross-platform support
* Optimized package structure for better performance

## 1.3.9

* Removed unused assets configuration
* Added Windows troubleshooting guide to README.md
* Improved documentation for Windows users
* Updated package dependencies

## 1.3.8

* Reverted to stable version with improved functionality
* Fixed UI consistency issues
* Enhanced documentation and examples
* Updated package dependencies

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

## 1.2.8

* Updated image URL in README.md to use GitHub Issues image URL for better compatibility

## 1.2.7

* Fixed image URL in README.md to display correctly on GitHub and pub.dev

## 1.2.6

* Fixed image display issues in README.md for both GitHub and pub.dev
* Updated image path to use absolute URL for better compatibility

## 1.2.5

* Fixed image display issues in README.md
* Improved documentation and examples
* Updated package description

## 1.2.4

* Fixed code formatting issues
* Improved documentation and examples
* Removed unused file (info_ui_package.dart)
* Updated package name references

## 1.2.3

* Updated package documentation and examples
* Fixed image display in README.md
* Improved code formatting and structure

## 1.2.2

* Added support for custom item decorations
* Improved error handling in AsyncValue support
* Added new example with InfoCard usage

## 1.2.1

* Initial release
* Basic InfoList widget implementation
* AsyncValue support for loading and error states
* InfoCard and InfoHeader components

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

* Added border control options to InfoCard and InfoCardWithRiverpod
* Added showBorder property to control border visibility
* Added borderColor property to customize border color
* Improved documentation for border customization

## 1.0.6

* Improved border radius handling in InfoCard
* Fixed header styling with rounded corners
* Updated flutter_riverpod to version 2.5.1
* Removed unnecessary Container widgets for better performance
* Enhanced documentation for padding options

## 1.0.5

* Initial release with basic functionality
* Added Info and InfoCard widgets
* Added InfoHeader component
* Added InfoList component
* Added Riverpod integration

## 1.0.4

* Initial release with basic functionality
* Added Info and InfoCard widgets
* Added InfoHeader component
* Added InfoList component
* Added Riverpod integration

## 1.0.3

* Added single import support for all components
* Improved documentation with import examples
* Enhanced package structure

## 1.0.2

* Fixed layout issues in InfoList widget
* Improved documentation and examples
* Enhanced error handling

## 1.0.1

* Added generic type support for `Info` and `InfoCard` widgets
* Improved Material 3 design system integration
* Added customizable styles for headers and list items
* Enhanced documentation and examples
* Fixed file naming to follow Dart style guide
* Added shadow effects to cards
* Improved padding and margin customization options

## 1.0.0

* Initial release of info_ui_package
* InfoList widget with AsyncValue support
* InfoCard widget for consistent card layouts
* InfoHeader widget for card headers
* Support for customizable styling and layouts
* Example documentation with screenshots
