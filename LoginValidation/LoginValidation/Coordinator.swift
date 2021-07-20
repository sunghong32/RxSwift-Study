//
//  Coordinator.swift
//  LoginValidation
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class Coordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
    }
}
