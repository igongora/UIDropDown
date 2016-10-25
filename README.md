# UIDropDown
An elegant dropdown for iOS written in Swift.

![](ddgif.gif)

# Overview
UIDropDown allows you to pick an option in a beautiful table just like dropdowns in web. It contains 3 differents animations to present the options table and can be modified in many ways.

# Usage
Use UIDropDown it's as easy as set the array of strings you want to show and a placeholder

```swift
drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
drop.placeholder = "Select your country..."
drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
drop.didSelect { (option, index) in
     self.label.text = "You just select \(option) at index: \(index)"
     print("You just select: \(option) at index: \(index)")
     }
self.view.addSubview(drop) 
```

The "didSelect" method will return the string and index selected
```swift
drop.didSelect { (option, index) in
     self.label.text = "You just select \(option) at index: \(index)"
     print("You just select: \(option) at index: \(index)")
     }
```

## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3+

## Author

Isaac Gongora, igongoracastano@gmail.com

## License

UIDropDown is available under the MIT license
