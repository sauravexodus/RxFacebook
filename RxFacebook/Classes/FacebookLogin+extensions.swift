
//
//  Created by Sourav Chandra on 02/10/17.
//
//

import RxSwift
import Foundation
import FacebookCore
import FacebookLogin

public extension LoginManager {
    public func logIn(with readPermissions: [ReadPermission], viewController: UIViewController?) -> Observable<LoginResult> {
        return Observable.create { [weak self] observer in
            guard let strongSelf = self else {
                observer.onNext(.failed(RxError.unknown))
                observer.onCompleted()
                return Disposables.create()
            }
            strongSelf.logIn(readPermissions, viewController: viewController, completion: { loginResult in
                observer.onNext(loginResult)
            })
            return Disposables.create()
        }
    }
    
    public func logIn(with publishPermission: [PublishPermission], viewController: UIViewController?) -> Observable<LoginResult> {
        return Observable.create { [weak self] observer in
            guard let strongSelf = self else {
                observer.onNext(.failed(RxError.unknown))
                observer.onCompleted()
                return Disposables.create()
            }
            strongSelf.logIn(publishPermission, viewController: viewController, completion: { loginResult in
                observer.onNext(loginResult)
            })
            return Disposables.create()
        }
    }
}
