//
//  ArticleViewModel.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import Foundation

struct ArticleViewModel {
    private let article: Article

    var imageUrl: String? {
        return article.urlToImage
    }

    var title: String? {
        return article.title
    }

    var description: String? {
        return article.description
    }
    
    init(article: Article) {
        self.article = article
    }
}
