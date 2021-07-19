//
//  Coordinator.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import UIKit

class Coordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
    }
}+
