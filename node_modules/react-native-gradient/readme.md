# react-native-gradient

Gradient component for React Native.

## Requirements

- iOS
	- Swift (see the last note on [this piece of documentation](https://facebook.github.io/react-native/docs/native-modules-ios#exporting-swift) for more info)
	- CocoaPods
- Android
	- Kotlin
	- Gradle

## Installation

First, use NPM to install this package:

```
npm install react-native-gradient --save
```

After this you can continue the installation for one (or all) platforms below.

### iOS

The only supported method of installing react-native-gradients is through CocoaPods. To do so, add the following to your Podfile:

```
pod 'react-native-gradient', :path => 'node_modules/react-native-gradient/ios'
```

### Android

The only supported method of installing react-native-gradients is through Gradle. To do so, follow these steps:

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
		- Add `import com.q42.rngradient.GradientPackage;` to the imports at the top of the file
		- Add `new GradientPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-gradient'
  	project(':react-native-gradient').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-gradient/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-gradient')
  	```

## Usage

### Linear gradient

The linear gradient is a component like any other:

```jsx
import Gradient from 'react-native-gradient';

<Gradient.Linear colors={['red', 'blue']} />
```

#### Props

- `colors` (required): An array of css-style colors, from the beginning to the end of the gradient.
- `locations` (optional, iOS only): An array of numbers, to manipulate how the gradient is drawn. For example, you can give it `[0.8, 1.0]` to show the first color for 80% of the gradient.
- Any other view-related props (like `style`, `transform` or `pointerEvents`) are passed through, so feel free to use those if you need them.

### Radial gradient

The radial gradient is a component like any other:

```jsx
import Gradient from 'react-native-gradient';

<Gradient.Radial colors={['red', 'blue']} radius={200} />
```

#### Props

- `colors` (required): An array of css-style colors, from the beginning to the end of the gradient.
- `radius` (required): A number of the size (points) of the radius.
- `locations` (optional, iOS only): An array of numbers, to manipulate how the gradient is drawn. For example, you can give it `[0.8, 1.0]` to show the first color for 80% of the gradient.
- `center` (optional): An array of exactly two numbers who define the center of the gradient in percentages. Defaults to `[0.5, 0.5]`.
- Any other view-related props (like `style`, `transform` or `pointerEvents`) are passed through, so feel free to use those if you need them.

## TODO

- Tests
- Angle support
- Remove the CocoaPods requirement
- Remove the Kotlin requirement
- Remove the Swift requirement
