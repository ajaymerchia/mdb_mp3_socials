//
//  Feed-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController {
    func initUI() {
        initNav()
    }
    
    func initNav() {
        
        
//        let navItem = UINavigationItem(title: "")
//        let navBarbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(go_back))
//        navItem.leftBarButtonItem = navBarbutton

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(go_to_new_social))
    }
    
    @objc func go_to_new_social() {
        performSegue(withIdentifier: "feed2new", sender: self)
    }
}
