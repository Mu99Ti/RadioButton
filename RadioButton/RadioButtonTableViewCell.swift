//
//  RadioButtonTableViewCell.swift
//  RadioButton
//
//  Created by Muhamad Talebi on 6/1/23.
//

import UIKit

class RadioButtonTableViewCell: UITableViewCell {
    
    
    private lazy var radioButton = RadioButton()
    
    // MARK: - UITableViewCell Initializing
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(radioButton)
        
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            radioButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            radioButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            radioButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            radioButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static var reuseIdentifier: String {
        return String.init(describing: self.self)
    }
}
