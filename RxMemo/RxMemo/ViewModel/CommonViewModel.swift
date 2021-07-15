//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/15.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorgeType

    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorgeType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
