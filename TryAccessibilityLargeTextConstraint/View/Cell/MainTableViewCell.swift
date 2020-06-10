//
//  MainTableViewCell.swift
//  TryAccessibilityLargeTextConstraint
//
//  Created by Aji Saputra Raka Siwi on 10/06/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    let petImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let petNameLabel: UILabel = {
        let label = UILabel()
        if let font = UIFont(name: "Noteworthy", size: 20) {
            label.font = UIFontMetrics(forTextStyle: .title2).scaledFont(for: font)
        }
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let petDescriptionLabel: UILabel = {
        let label = UILabel()
        if let font = UIFont(name: "Noteworthy", size: 16) {
            label.font = UIFontMetrics.default.scaledFont(for: font)
        }
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 3
        return label
    }()
    
    let battleButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("BATTLE", for: .normal)
        button.setTitleColor(button.tintColor, for: .normal)
        button.backgroundColor = UIColor.clear
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.layer.borderWidth = 1
        button.layer.borderColor = button.tintColor.cgColor
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .white
        
        self.addSubview(petImageView)
        self.addSubview(petNameLabel)
        self.addSubview(petDescriptionLabel)
        self.addSubview(battleButton)
        
        self.updateLayoutConstraints()
    }
    
    //Constraint for regular text
    private func setRegularConstraint(){
        self.petImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(24)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self.petNameLabel.snp.left).offset(-16)
            make.bottom.lessThanOrEqualTo(self).offset(-24)
            make.size.equalTo(CGSize(width: 100, height: 100)).priority(999)
        }
        
        self.petNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(24)
            make.left.equalTo(self.petImageView.snp.right).offset(16)
            make.right.equalTo(self.battleButton.snp.left).offset(-16)
            make.height.lessThanOrEqualTo(24)
        }
        
        self.petDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.petNameLabel.snp.bottom)//.offset(24)
            make.left.equalTo(self.petImageView.snp.right).offset(16)
            make.right.equalTo(self.battleButton.snp.left).offset(-16)
            make.bottom.lessThanOrEqualTo(self).offset(-24)
        }
        
        self.battleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(24)
            make.right.equalTo(self).offset(-16)
            make.size.greaterThanOrEqualTo(CGSize(width: 50, height: 20))
        }
    }
    
    //Constraint for large text
    private func setLargeTextConstraint(){
        self.petImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(24)
            make.left.equalTo(self).offset(16)
            make.size.equalTo(CGSize(width: 100, height: 100))//.priority(999)
        }
        
        self.petNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.petImageView.snp.bottom)//.offset(0)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
        }
        
        self.petDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.petNameLabel.snp.bottom)//.offset(0)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
        }
        
        self.battleButton.snp.makeConstraints { (make) in
            make.top.equalTo(petDescriptionLabel.snp.bottom).offset(24)
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self).offset(-16)
            make.size.greaterThanOrEqualTo(CGSize(width: 50, height: 20))
        }
    }
    
    private func updateLayoutConstraints() {
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            self.setLargeTextConstraint()
            
        } else {
            self.setRegularConstraint()
        }
    }
}
