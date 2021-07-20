//
//  LoginViewModel.swift
//  LoginValidation
//
//  Created by 민성홍 on 2021/07/20.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {
    // MARK: Properties
    let idPublishSubject = PublishSubject<String>()
    let pwPublishSubject = PublishSubject<String>()

    //MARK: Helpers
    func isValid() -> Observable<Bool> {
        Observable.combineLatest(idPublishSubject.asObserver(), pwPublishSubject.asObserver()).map { id, pw in
            return id.count > 3 && pw.count > 3
        }
    }
}
