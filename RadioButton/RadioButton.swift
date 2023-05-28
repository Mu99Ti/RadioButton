//
//  RadioButton.swift
//  RadioButton
//
//  Created by Muhamad Talebi on 5/28/23.
//

import UIKit

class RadioButton: UIView {
    
    // MARK: - Private Properties
    private var allignment: RadioButton.Allignment = .LTR
    private var selection: Bool = false
    private var highlightColor: UIColor? = .black
    private var highlightedButtonBorderWidth: CGFloat = 2
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "testtesttest"
        return label
    }()
    
    private lazy var radioButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = frame.height/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var radioButtonHighlitedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var mainStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        return stackView
    }()
    
    // MARK: - Initializing View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: - Add Subviews
        addSubview(mainStackview)
        
        radioButton.addSubview(radioButtonHighlitedButton)
        
        // MARK: - Setup Constraints
        let radioButtonSizeConstraints = [
            radioButton.heightAnchor.constraint(equalToConstant: 24),
            radioButton.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        let highlightedButtonConstraints = [
            radioButtonHighlitedButton.centerXAnchor.constraint(equalTo: radioButton.centerXAnchor),
            radioButtonHighlitedButton.centerYAnchor.constraint(equalTo: radioButton.centerYAnchor),
            radioButtonHighlitedButton.heightAnchor.constraint(equalToConstant: 16),
            radioButtonHighlitedButton.widthAnchor.constraint(equalToConstant: 16)
        ]
        
        let mainStackViewConstraints = [
            mainStackview.topAnchor.constraint(equalTo: topAnchor),
            mainStackview.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackview.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackview.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]
        
        
        NSLayoutConstraint.activate(radioButtonSizeConstraints)
        NSLayoutConstraint.activate(highlightedButtonConstraints)
        NSLayoutConstraint.activate(mainStackViewConstraints)
        
        // MARK: - Configure View
        setup(allignment)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Internal Methods
    internal func configure(componnentAllignment: RadioButton.Allignment? = .LTR, value: String? = nil, highlightedColor: UIColor? = .black) {
        if let componnentAllignment {
            allignment = componnentAllignment
        }
        valueLabel.text = value
        highlightColor = highlightedColor
    }
    
    // MARK: - Private Methods
    private func setup(_ allignment: RadioButton.Allignment) {
        switch allignment {
        case .LTR:
            mainStackview.alignment = .leading
            valueLabel.textAlignment = .left
            mainStackview.addArrangedSubview(radioButton)
            mainStackview.addArrangedSubview(valueLabel)
        case .RTL:
            mainStackview.alignment = .trailing
            valueLabel.textAlignment = .right
            mainStackview.addArrangedSubview(valueLabel)
            mainStackview.addArrangedSubview(radioButton)
        }
        
        backgroundColor = .systemBackground
        radioButton.layer.cornerRadius = 12
        radioButtonHighlitedButton.layer.cornerRadius = 8
    }
    
    @objc
    private func radioButtonTapped() {
        selection = true
        radioButtonHighlitedButton.backgroundColor = .black
        radioButton.layer.borderColor = UIColor.black.cgColor
        radioButton.layer.borderWidth = highlightedButtonBorderWidth
    }
}

extension RadioButton {
    enum Allignment {
        case RTL
        case LTR
    }
}

