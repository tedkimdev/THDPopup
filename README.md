THDPopup
========
  
A simple custom popup view controller.

<img width="394" alt="2017-03-16 8 50 34" src="https://cloud.githubusercontent.com/assets/20268356/23975700/cb93126c-0a25-11e7-8e6b-d41806cfe087.png">

Example
-------

Here's an example usage.

```swift
final class MyViewController: UIViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    
    let popupViewController = THDPopupViewController(
      width: CGFloat(360),
      top: CGFloat(110),
      imageURL: "https://dummyimage.com/300x400",
      leftButtonTitle: "No thanks",
      rightButtonTitle: "✕ close",
      imageButtonDidTap: {
        print("imageButtonDidTap")
    },
      leftButtonDidTap: {
        print("leftButtonDidTap")
    },
      rightButtonDidTap: {
        print("rightButtonDidTap")
    })
    
    self.present(popupViewController, animated: true, completion: nil)
    
  }
  
}
```


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

```ruby
pod 'THDPopup', '~> 0.0'
```


License
-------

**Then** is under MIT license. See the [LICENSE](LICENSE) file for more info.
