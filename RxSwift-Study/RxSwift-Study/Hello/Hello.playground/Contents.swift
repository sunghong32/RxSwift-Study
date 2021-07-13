import UIKit
import RxSwift

let disposeBag = DisposeBag()

Observable.just("Hello, RxSwift")
    .subscribe { print($0) }
    .disposed(by: disposeBag)
