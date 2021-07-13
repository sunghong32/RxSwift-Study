import UIKit
import RxSwift

let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
    .subscribe{ element in print(element) }
    .disposed(by: disposeBag)
