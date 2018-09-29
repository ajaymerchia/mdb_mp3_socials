//
//  LoginViewController.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var mdb_logo: UIImageView!
    var socialman: [UIImageView] = []
    
    var mdb_header: UILabel!
    var socials_header: UILabel!
    
    var username_field: UITextField!
    var password_field: UITextField!
    
    var login_button: UIButton!
    var advance_to_login: UIButton!
    var sign_up_button: UIButton!
    
    var currUsername: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        connect_buttons()
        
//        Utils.printFontFamilies()
    }
    
    

}
