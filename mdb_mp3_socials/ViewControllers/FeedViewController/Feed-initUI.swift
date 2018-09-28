//
//  Feed-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

extension FeedViewController {
    func initUI() {
        initNav()
        addListView()
    }
    
    
    /// Adds the TableView to the ViewController
    func addListView() {
        socialsList = UITableView(frame: CGRect(x: Utils.PADDING, y: UIApplication.shared.statusBarFrame.maxY, width: view.frame.width-2*Utils.PADDING, height: view.frame.height-UIApplication.shared.statusBarFrame.maxY-Utils.PADDING))
        socialsList.register(SocialCell.self, forCellReuseIdentifier: "socialcell")
        socialsList.delegate = self
        socialsList.dataSource = self
        socialsList.rowHeight = view.frame.height/3
        view.addSubview(socialsList)
    }
    
    func initNav() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(go_to_new_social))
    }
    
    @objc func go_to_new_social() {
        performSegue(withIdentifier: "feed2new", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? DetailViewController {
            VC.event = selectedEvent
        }
    }
    
    
}
