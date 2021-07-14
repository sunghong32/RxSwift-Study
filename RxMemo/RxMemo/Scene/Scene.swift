//
//  Scene.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)

        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else {
                fatalError()
            }

            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }

            listVC.bind(viewModel: viewModel)
            return nav
        case .detail(let viewModel):
            guard var DetailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else {
                fatalError()
            }

            DetailVC.bind(viewModel: viewModel)
            return DetailVC
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
                fatalError()
            }

            guard var ComposeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }

            ComposeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
