//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import Foundation
import RxSwift

protocol MemoStorgeType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>

    @discardableResult
    func memoList() -> Observable<[Memo]>

    @discardableResult
    func <#name#>(memo: Memo, content: String) -> Observable<Memo>

    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
