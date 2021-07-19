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

    private let articles = BehaviorRelay<[Article]>(value: [])
    var articlesObserver: Observable<[Article]> {
        return articles.asObservable()
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
        self.viewModel.fetchArticles()
            .subscribe(onNext: { articles in
                self.articles.accept(articles)
            })
            .disposed(by: disposeBag)
    }

    func subscribe() {
        self.articlesObserver
            .subscribe(onNext: { articles in
                // collectionView를 생성할 예정. 이때 collectionView.reloadData 함수를 호출.
            })
            .disposed(by: disposeBag)
    }
}
