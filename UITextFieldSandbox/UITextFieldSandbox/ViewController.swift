//
//  ViewController.swift
//  UITextFieldSandbox
//
//  Created by Juhyun Yun on 2023/07/07.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .tertiarySystemGroupedBackground
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(textField)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

//MARK: - Action
extension ViewController {
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text!)
    }
}
