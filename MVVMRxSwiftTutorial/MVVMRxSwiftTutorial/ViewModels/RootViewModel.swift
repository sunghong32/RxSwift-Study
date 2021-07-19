//
//  RootViewModels.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "Sunghong News"

    private let articleService: ArticleServiceProtocol

    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }

    func fetchArticles() -> Observable<[ArticleViewModel]> {
        articleService.fetchNews().map { $0.map { ArticleViewModel(article: $0) } }
    }
}
