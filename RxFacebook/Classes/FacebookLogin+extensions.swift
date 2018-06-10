
//
//  Created by Sourav Chandra on 02/10/17.
//
//

import RxSwift
import Foundation
import FacebookCore
import FacebookLogin

public extension Reactive where Base: LoginManager {
    public func logIn(with readPermissions: [ReadPermission], viewController: UIViewController? = nil) -> Observable<LoginResult> {
        return Observable.create {  observer in
            self.base.logIn(readPermissions: readPermissions, viewController: viewController, completion: { (loginResult) in
                if case let .failed(error) = loginResult {
                    observer.onError(error)
                } else {
                    observer.onNext(loginResult)
                    observer.onCompleted()
                }
            })
            return Disposables.create()
        }
    }
    
    public func logIn(with publishPermissions: [PublishPermission], viewController: UIViewController? = nil) -> Observable<LoginResult> {
        return Observable.create { observer in
            self.base.logIn(publishPermissions: publishPermissions, viewController: viewController, completion: { loginResult in
                if case let .failed(error) = loginResult {
                    observer.onError(error)
                } else {
                    observer.onNext(loginResult)
                    observer.onCompleted()
                }
            })
            return Disposables.create()
        }
    }
}

extension LoginManager: ReactiveCompatible {}
