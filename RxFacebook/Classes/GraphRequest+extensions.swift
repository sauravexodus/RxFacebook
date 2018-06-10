//
//  GraphRequest+extensions.swift
//  Pods
//
//  Created by Sourav Chandra on 02/10/17.
//
//

import Foundation
import FacebookCore
import FacebookLogin
import RxSwift

public extension Reactive where Base: GraphRequestProtocol {
    public func getResponse() -> Observable<GraphRequestResult<GraphRequest>> {
        return Observable.create { observer in
            self.base.start { (response, result) in
                if case let GraphRequestResult.failed(error) = result {
                    observer.onError(error)
                    return
                } else if let `result` = result as? GraphRequestResult<GraphRequest> {
                    observer.onNext(result)
                    observer.onCompleted()
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}

extension GraphRequest: ReactiveCompatible {}
