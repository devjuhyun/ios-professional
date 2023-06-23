//
//  ViewController.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let discriptionLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        // 사이즈가 자동으로 설정되는 것을 방지하기 위해 커스텀 뷰와 오토레이아웃을 사용할 때 항상 이걸 해줘야 한다.
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed // system colors -> 어떤 모드인지에 따라 자동으로 색이 살짝 바뀐다.
        errorMessageLabel.numberOfLines = 0 // multiline
        errorMessageLabel.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = "Bankey"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.textAlignment = .center
        discriptionLabel.numberOfLines = 0
        discriptionLabel.text = "Your premium source for all things banking!"
        discriptionLabel.font = .systemFont(ofSize: 20)
    }
    
    private func layout() {
        // view controller에 추가
        view.addSubview(titleLabel)
        view.addSubview(discriptionLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ] )
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Message Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Discription Label
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: discriptionLabel.bottomAnchor, multiplier: 3),
            discriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            discriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        // Title Label
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil") // 나에게 보내는 메세지, 이 메세지를 받는다는건 버그가 있다는 뜻
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true // 버튼에 로딩 애니메이션 추가
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
