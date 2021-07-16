//
//  MemoDetailViewModel.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import Foundation
import RxCocoa
import RxSwift
import Action

class MemoDetailViewModel: CommonViewModel {
    let memo: Memo

    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "KO_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium

        return f
    }()

    var contents: BehaviorSubject<[String]>

    init(memo: Memo, title: String, sceneCoordinator: SceneCoordinatorType, storge: MemoryStorage) {
        self.memo = memo

        contents = BehaviorSubject<[String]>(value: [
            memo.content,
            formatter.string(from: memo.insertDate)
        ])

        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storge)
    }
}
