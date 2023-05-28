//
//  RadioButtonView.swift
//  RadioButton
//
//  Created by Muhamad Talebi on 5/28/23.
//

import UIKit

class RadioButtonView: UIView {
    
    private lazy var radioButtonsArray: [RadioButton] = [RadioButton()]
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - Initializing View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainStackView)
        
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
