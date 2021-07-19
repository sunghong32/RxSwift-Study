//
//  RootViewController.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import UIKit
import RxSwift
import RxRelay

class RootViewController: UIViewController {

    // MARK: Properties
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel

    private var articleViewModel = BehaviorRelay<[ArticleViewModel]>(value: [])
    var articleViewModelObserver: Observable<[ArticleViewModel]> {
        return articleViewModel.asObservable()
    }

    // MARK: LifeCycles
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        fetchArticles()
        subscribe()
    }

    // MARK: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    // MARK: Helpers
    func fetchArticles() {
        viewModel.fetchArticles()
            .subscribe(onNext: { articleViewModels in
                self.articleViewModel.accept(articleViewModels)
            })
            .disposed(by: disposeBag)
    }

    func subscribe() {
        self.articleViewModelObserver
            .subscribe(onNext: { articles in
                // collectionView reload
                print(articles)
            })
            .disposed(by: disposeBag)
    }
}
