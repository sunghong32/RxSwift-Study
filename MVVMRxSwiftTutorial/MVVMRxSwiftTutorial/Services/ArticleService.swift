//
//  ArticleService.swift
//  MVVMRxSwiftTutorial
//
//  Created by 민성홍 on 2021/07/19.
//

import Foundation
import Alamofire
import RxSwift

class ArticleService {

    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in

            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }

                if let articles = articles {
                    observer.onNext(articles)
                }

                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-06-19&sortBy=publishedAt&apiKey=2c8ae2706f1b41558924fe7ba071edb3"

        guard let url = URL(string: urlString) else { return completion(NSError(domain: "sunghong32", code: 404, userInfo: nil), nil)}

        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }

            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        }
    }
}
