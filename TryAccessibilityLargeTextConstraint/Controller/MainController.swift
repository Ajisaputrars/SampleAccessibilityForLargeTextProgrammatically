//
//  ViewController.swift
//  TryAccessibilityLargeTextConstraint
//
//  Created by Aji Saputra Raka Siwi on 10/06/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    private var mainView: MainView!
    private var pets = PetDataSource.petList()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView = MainView(frame: self.view.frame)
        self.view = self.mainView
        
        
        self.mainView.mainTableView.delegate = self
        self.mainView.mainTableView.dataSource = self
    }
}


extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.petNameLabel.text = self.pets[indexPath.row].name
        cell.petImageView.image = self.pets[indexPath.row].image
        cell.petDescriptionLabel.text = self.pets[indexPath.row].specialPowers
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
