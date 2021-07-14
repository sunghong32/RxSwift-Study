//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case NavigationControllerMissing
    case cannotPop
    case unknown
}
