//
//  DummyViewController.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/26.
//

import UIKit

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let loggoutButton = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        loggoutButton.translatesAutoresizingMaskIntoConstraints = false
        loggoutButton.configuration = .filled()
        loggoutButton.setTitle("Logout", for: [])
        // selector는 타입이고 #selector를 붙여주면 objc의 메소드를 호출하거나 참조할 수 있다.
        // 이 경우 logoutButtonTapped라는 objc 메소드를 참조(포인팅) 한 것.
        loggoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(loggoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // UIKit은 대부분 objc로 짜여져 있고 @objc 키워드를 작성하면 objc를 swift 안에서 돌릴 수 있게 해준다.
    // method signature listen 1 = sender: UIButton
    @objc func logoutButtonTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}
