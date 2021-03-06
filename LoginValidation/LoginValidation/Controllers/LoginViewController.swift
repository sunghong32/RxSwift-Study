//
//  LoginViewController.swift
//  LoginValidation
//
//  Created by 민성홍 on 2021/07/20.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    // MARK: Properties
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()

    private lazy var idTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "id"
        textField.placeholder = "Enter your ID"
        textField.leadingAssistiveLabel.text = "This is where enter your id"
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.sizeToFit()
        return textField
    }()

    private lazy var pwTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "pw"
        textField.placeholder = "Enter your PW"
        textField.leadingAssistiveLabel.text = "This is where enter your pw"
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.sizeToFit()
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var loginButton: MDCButton = {
        let button = MDCButton()
        button.setTitle("login", for: UIControl.State.normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setBackgroundColor(UIColor.purple)
        button.isUserInteractionEnabled = false
        button.alpha = 0.3
        return button
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [idTextField, pwTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 50
        return stack
    }()

    // MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureKeyboard()
        loginBind()
    }

    // MARK: Configures
    func configureKeyboard() {
        dismissKeyboardWhenTappedAround()
        moveViewWhenKeyboardAppeardOrDisappeared()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }

    // MARK: Binds
    func loginBind() {
        self.idTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.idPublishSubject)
            .disposed(by: disposeBag)
        self.pwTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.pwPublishSubject)
            .disposed(by: disposeBag)

        viewModel.isValid()
            .subscribe(onNext: { valid in
                self.loginButton.isUserInteractionEnabled = valid
                if valid {
                    self.loginButton.alpha = 1
                } else {
                    self.loginButton.alpha = 0.3
                }
            })
            .disposed(by: disposeBag)
    }
}
