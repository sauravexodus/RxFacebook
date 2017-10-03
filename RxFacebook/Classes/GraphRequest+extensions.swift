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

public extension GraphRequest {
    public func getResponse() -> Observable<GraphRequestResult<GraphRequest>> {
        return Observable.create { observer in
            self.start { (response, result) in
                if response?.statusCode != 200 {
                    observer.onError(RxError.timeout)
                    observer.onCompleted()
                    return
                }
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
