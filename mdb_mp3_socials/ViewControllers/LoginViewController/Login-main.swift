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
    
    
    var socials_header: UILabel!
    
    var username_field: UITextField!
    var password_field: UITextField!
    
    var login_button: UIButton!
    var sign_up_button: UIButton!
    
    var currUsername: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        connect_buttons()
        
//        Utils.printFontFamilies()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
