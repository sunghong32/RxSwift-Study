//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable

    @discardableResult
    func delete(animated: Bool) -> Completable
}
