//
//  RootViewController.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
