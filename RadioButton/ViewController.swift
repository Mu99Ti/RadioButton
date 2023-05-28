//
//  ViewController.swift
//  RadioButton
//
//  Created by Muhamad Talebi on 5/28/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var radio = RadioButton()
    private lazy var radio2 = RadioButton()
    private lazy var radio3 = RadioButton()
    private lazy var radio4 = RadioButton()
    private lazy var radio5 = RadioButton()
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(mainStack)
        
        
        mainStack.addArrangedSubview(radio)
        mainStack.addArrangedSubview(radio2)
        mainStack.addArrangedSubview(radio3)
        mainStack.addArrangedSubview(radio4)
        mainStack.addArrangedSubview(radio5)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

