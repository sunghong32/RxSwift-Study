//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by 민성홍 on 2021/07/14.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
