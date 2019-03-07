# wobbly

[![CI Status](https://img.shields.io/travis/sagaya/wobbly.svg?style=flat)](https://travis-ci.org/sagaya/wobbly)
[![Version](https://img.shields.io/cocoapods/v/wobbly.svg?style=flat)](https://cocoapods.org/pods/wobbly)
[![License](https://img.shields.io/cocoapods/l/wobbly.svg?style=flat)](https://cocoapods.org/pods/wobbly)
[![Platform](https://img.shields.io/cocoapods/p/wobbly.svg?style=flat)](https://cocoapods.org/pods/wobbly)

![Screenshot](wobble.png)


[See Wobbly in action](https://sagaya.github.io/Wobbly) 

Just-add-water iOS animation

`wobbly`  is a bunch of cool, fun, and easy to use iOS animations for you to use in your projects. Animation types taken from [Animate CSS](https://daneden.github.io/animate.css/)  (Animate CSS for iOS 👻)


## Installation

wobbly is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'wobbly'
```

## Usage
To use wobbly in your, simply install it through `cocoapods` or drag and drop the wobbly folder into your project,  and simply call the type of animation you want on any type of view 
```swift
view.bounce()

image.jello()

button.shake()

view.bounceInLeft()

label.Swing()
```

### Animations

To animate an element, add the class `animated` to an element. You can include the class `infinite` for an infinite loop. Finally you need to add one of the following classes to the element (This has all the  [Animate CSS](https://daneden.github.io/animate.css/) animations )

| Class Name        |                    |                     |                      |
| ----------------- | ------------------ | ------------------- | -------------------- |
| `bounce`          | `flash`            | `pulse`             | `rubberBand`         |
| `shake`           | `headShake`        | `swing`             | `tada`               |
| `wobble`          | `jello`            | `bounceIn`          | `bounceInDown`       |
| `bounceInLeft`    | `bounceInRight`    | `bounceInUp`        | `bounceOut`          |
| `bounceOutDown`   | `bounceOutLeft`    | `bounceOutRight`    | `bounceOutUp`        |
| `fadeIn`          | `fadeInDown`       | `fadeInDownBig`     | `fadeInLeft`         |
| `fadeInLeftBig`   | `fadeInRight`      | `fadeInRightBig`    | `fadeInUp`           |
| `fadeInUpBig`     | `fadeOut`          | `fadeOutDown`       | `fadeOutDownBig`     |
| `fadeOutLeft`     | `fadeOutLeftBig`   | `fadeOutRight`      | `fadeOutRightBig`    |
| `fadeOutUp`       | `fadeOutUpBig`     | `flipInUp`           | `flipInDown`            |
| `flip`        | `flipInRight`         | `lightSpeedIn`      | `lightSpeedOut`      |
| `rotateIn`        | `rotateInDownLeft` | `rotateInDownRight` | `rotateInUpLeft`     |
| `rotateInUpRight` | `rotateOut`        | `rotateOutDownLeft` | `rotateOutDownRight` |
| `rotateOutUpLeft` | `rotateOutUpRight` | `hinge`             | `jackInTheBox`       |
| `rollIn`          | `rollOut`          | `zoomIn`            | `zoomInDown`         |
| `zoomInLeft`      | `zoomInRight`      | `zoomInUp`          | `zoomOut`            |
| `zoomOutDown`     | `zoomOutLeft`      | `zoomOutRight`      | `zoomOutUp`          |
| `slideInDown`     | `slideInLeft`      | `slideInRight`      | `slideInUp`          |
| `slideOutDown`    | `slideOutLeft`     | `slideOutRight`     | `slideOutUp`         |
| `heartBeat`       |

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

## Author

sagaya, shaggy.hafeez@gmail.com

## Contributing 

Pull requests are the way to go here. We only have two rules for submitting a pull request: match the naming convention (camelCase, categorised [fades, bounces, etc]) 

## License

wobbly is available under the MIT license. See the LICENSE file for more info.
