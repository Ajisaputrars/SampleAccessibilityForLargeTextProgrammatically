//
//  MainView.swift
//  TryAccessibilityLargeTextConstraint
//
//  Created by Aji Saputra Raka Siwi on 10/06/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let mainTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 148.5
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(mainTableView)
        
        self.mainTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
