//
//  BindingCocoaTouchViewController.swift
//  RxSwift-Study
//
//  Created by 민성홍 on 2021/07/14.
//

import UIKit
import RxSwift
import RxCocoa

class BindingCocoaTouchViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueField: UITextField!

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueLabel.text = ""
        valueField.becomeFirstResponder()

//        valueField.rx.text
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { [weak self] str in
//                self?.valueLabel.text = str
//            })
//            .disposed(by: bag)

        valueField.rx.text
            .bind(to: valueLabel.rx.text)
            .disposed(by: bag)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        valueField.resignFirstResponder()
    }
}

extension BindingCocoaTouchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let currentText = textField.text else {
            return true
        }

        let finalText = (currentText as NSString).replacingCharacters(in: range, with: string)
        valueLabel.text = finalText

        return true
    }
}
