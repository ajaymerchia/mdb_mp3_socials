//
//  Login-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit
import ChameleonFramework

extension LoginViewController {
    func initUI() {
        init_img()
        init_text()
        init_textfield()
        init_buttons()
        
        Utils.addBackgroundImage(given_view: view)
    }
    
    func init_img() {
        mdb_logo = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: view.frame.height/5))
        
        
        let LOGO_WIDTH: CGFloat = 480
        let PHONE_WIDTH: CGFloat = 350
        let CENTER_BIAS = (LOGO_WIDTH-PHONE_WIDTH)/(2*LOGO_WIDTH)
        
        
        mdb_logo.center = CGPoint(x: view.frame.width/(2-CENTER_BIAS), y: view.frame.height/3.333)
        mdb_logo.image = UIImage(named: "mdb_logo_white")
        mdb_logo.contentMode = .scaleAspectFill
        view.addSubview(mdb_logo)
    }
    
    func init_text() {
        socials_header = UILabel(frame: CGRect(x: 0, y: mdb_logo.frame.maxY + 1.5*Utils.PADDING, width: view.frame.width, height: 100))
        socials_header.textAlignment = .center
        
        socials_header.text = "Socials"
        socials_header.textColor = UIColor.white
        socials_header.font = UIFont(name: "OpenSans-Semibold", size: 80)
        
        socials_header.adjustsFontSizeToFitWidth = true

        view.addSubview(socials_header)
    }
    
    func init_textfield() {
        username_field = UITextField(frame: CGRect(x: 2 * Utils.PADDING, y: socials_header.frame.maxY + Utils.PADDING*2.5, width: view.frame.width - 4 * Utils.PADDING, height: 40))
        
        username_field.backgroundColor = rgba(0,0,0,0.2)
        username_field.insetsLayoutMarginsFromSafeArea = true
        username_field.textColor = .white
        username_field.attributedPlaceholder = NSAttributedString(string: "Username",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        username_field.layer.cornerRadius = 5
        
        
        view.addSubview(username_field)
        
        
        
        password_field = UITextField(frame: CGRect(x: 2 * Utils.PADDING, y: username_field.frame.maxY + Utils.PADDING/2, width: view.frame.width - 4 * Utils.PADDING, height: 40))
        
        password_field.backgroundColor = rgba(0,0,0,0.2)
        password_field.insetsLayoutMarginsFromSafeArea = true
        password_field.textColor = .white
        password_field.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        password_field.layer.cornerRadius = 5
        password_field.isSecureTextEntry = true
        
        
        view.addSubview(password_field)
    }
    
    func init_buttons() {
        login_button = UIButton(frame: CGRect(x: 4*Utils.PADDING, y: password_field.frame.maxY + Utils.PADDING, width: view.frame.width - 8*Utils.PADDING, height: 40))
        login_button.setTitle("Login", for: .normal)
        login_button.backgroundColor = UIColor.flatGray
        
        view.addSubview(login_button)
        
        sign_up_button = UIButton(frame: CGRect(x: 4*Utils.PADDING, y: login_button.frame.maxY, width: view.frame.width - 8*Utils.PADDING, height: 40))
        sign_up_button.setTitle("New Here? Sign Up!", for: .normal)
        
        view.addSubview(sign_up_button)
    }
    
}
