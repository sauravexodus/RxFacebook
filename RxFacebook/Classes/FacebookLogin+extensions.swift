
//
//  Created by Sourav Chandra on 02/10/17.
//
//

import RxSwift
import Foundation
import FacebookCore
import FacebookLogin

public extension LoginManager {
    public func logIn(with readPermissions: [ReadPermission], viewController: UIViewController? = nil) -> Observable<LoginResult> {
        return Observable.create { [weak self] observer in
            guard let strongSelf = self else {
                observer.onError(RxError.unknown)
                observer.onCompleted()
                return Disposables.create()
            }
            strongSelf.logIn(readPermissions, viewController: viewController, completion: { loginResult in
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
    
    public func logIn(with publishPermission: [PublishPermission], viewController: UIViewController? = nil) -> Observable<LoginResult> {
        return Observable.create { [weak self] observer in
            guard let strongSelf = self else {
                observer.onError(RxError.unknown)
                observer.onCompleted()
                return Disposables.create()
            }
            strongSelf.logIn(publishPermission, viewController: viewController, completion: { loginResult in
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
