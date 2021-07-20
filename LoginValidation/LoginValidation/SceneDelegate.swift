//
//  SceneDelegate.swift
//  LoginValidation
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let coordinator = Coordinator(window: window!)
        coordinator.start()
    }
}

