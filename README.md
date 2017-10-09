<p align="center"><img src="https://raw.githubusercontent.com/sauravexodus/RxFacebook/master/RxFacebook/Assets/RxFacebookLogo.png" height="120"/>

[![Version](https://img.shields.io/cocoapods/v/RxFacebook.svg?style=flat)](http://cocoapods.org/pods/RxFacebook)
[![License](https://img.shields.io/cocoapods/l/RxFacebook.svg?style=flat)](http://cocoapods.org/pods/RxFacebook)
[![Platform](https://img.shields.io/cocoapods/p/RxFacebook.svg?style=flat)](http://cocoapods.org/pods/RxFacebook)

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
import FacebookLogin
import FacebookCore

class Example {
	let loginManager = LoginManager()

	func signIn() {
        loginManager.logIn(with: [.publicProfile]).flatMap { [weak self] (loginResult) -> Observable<EmailResult> in
                guard let strongSelf = self else { return .just((nil, "Something went wrong")) }
                switch loginResult {
                case .cancelled: return .just((nil, "User cancelled the result"))
                case let .failed(error): return .just((nil, error.localizedDescription))
                // Extract the facebook login result here and chain it with your graph request
                case let .success(acceptedPermissions, declinedPermissions, accessToken): return strongSelf.fetchEmail()
                }
            }
            .subscribe(onNext: { email, error in
                if let `email` = email {
                    print(email)
                } else if let `error` = error {
                    print(error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func fetchEmail() -> Observable<EmailResult> {
        let graphRequest  = GraphRequest(graphPath: "/me")
        return graphRequest.getResponse().map { result in
            switch result {
            case let .success(response):
                guard let objectMap = response.dictionaryValue, let email = objectMap["email"] as? String else { return (nil, "Couldn't find email") }
                return (email, nil)
            case let .failed(error):
                return (nil, error.localizedDescription)
            }
        }
    }
}
```

## Requirements
```ruby
pod 'RxSwift'
pod 'FacebookCore'
pod 'FacebookLogin'
```

## Installation
RxFacebook is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxFacebook'
```

## Author
Sourav Chandra
RxSwift Enthusiast
saurav.chandra1992@live.com

## License
RxFacebook is available under the MIT license. See the LICENSE file for more info.
