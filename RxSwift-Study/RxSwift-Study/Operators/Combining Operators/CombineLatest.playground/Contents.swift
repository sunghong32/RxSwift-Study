import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let greetings = PublishSubject<String>()
let langueges = PublishSubject<String>()

Observable.combineLatest(greetings, langueges) { lhs, rhs -> String in
    return "\(lhs) \(rhs)"
}
    .subscribe { print($0) }
    .disposed(by: bag)

greetings.onNext("Hi")
langueges.onNext("World!")

greetings.onNext("Hello")
langueges.onNext("RxSwift")

//greetings.onCompleted()
greetings.onError(MyError.error)

langueges.onNext("SwiftUI")

langueges.onCompleted()
