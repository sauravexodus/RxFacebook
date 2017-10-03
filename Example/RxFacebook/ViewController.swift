//
//  ViewController.swift
//  RxFacebook
//
//  Created by sauravexodus on 09/17/2017.
//  Copyright (c) 2017 sauravexodus. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import RxSwift
import RxFacebook

class ViewController: UIViewController {
    
    let loginManager = LoginManager()
    let disposeBag = DisposeBag()
    typealias EmailResult = (String?, String?)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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

