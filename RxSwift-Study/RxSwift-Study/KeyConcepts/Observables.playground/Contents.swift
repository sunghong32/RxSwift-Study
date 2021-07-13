import UIKit
import RxSwift

// #1
Observable<Int>.create { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)

    observer.onCompleted()

    return Disposables.create()
}

// #2
Observable.from([0, 1])

