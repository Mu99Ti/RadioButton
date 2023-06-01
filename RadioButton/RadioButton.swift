//
//  RadioButton.swift
//  RadioButton
//
//  Created by Muhamad Talebi on 5/28/23.
//

import UIKit

class RadioButton: UIButton {
    
    // MARK: - Private Properties
    private var allignment: RadioButton.Allignment = .LTR
    private var highlightColor: UIColor? = .black
    private var highlightedButtonBorderWidth: CGFloat = 2
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "testtesttest"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var radioButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var mainStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()
    
    // MARK: - Initializing View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: - Add Subviews
        addSubview(mainStackview)
        
        // MARK: - Setup Constraint
        NSLayoutConstraint.activate([
            radioButtonImageView.widthAnchor.constraint(equalToConstant: 24),
            radioButtonImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            mainStackview.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackview.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackview.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
        
        // MARK: - Configure View
        addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
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
            mainStackview.addArrangedSubview(radioButtonImageView)
            mainStackview.addArrangedSubview(valueLabel)
        case .RTL:
            mainStackview.alignment = .trailing
            valueLabel.textAlignment = .right
            mainStackview.addArrangedSubview(valueLabel)
            mainStackview.addArrangedSubview(radioButtonImageView)
        }
        
        backgroundColor = .clear
        radioButtonImageView.layer.cornerRadius = 12
        radioButtonImageView.image = UIImage(named: "RadioButton")
    }
    
    @objc
    private func radioButtonTapped() {
        radioButtonImageView.layer.borderColor = UIColor.black.cgColor
        radioButtonImageView.layer.borderWidth = highlightedButtonBorderWidth
        radioButtonImageView.image = UIImage(named: "RadioButton Selected")
    }
}

extension RadioButton {
    enum Allignment {
        case RTL
        case LTR
    }
}

