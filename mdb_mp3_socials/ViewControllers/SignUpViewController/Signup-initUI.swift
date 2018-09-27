//
//  SignUpViewController-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension SignUpViewController {
    func initUI() {
        init_textfield()
        init_buttons()
        
        Utils.addBackgroundImage(given_view: view)
    }
    
    
    
    func init_textfield() {
        fullname_field = UITextField(frame: CGRect(x: 2 * Utils.PADDING, y: view.frame.width/2, width: view.frame.width - 4 * Utils.PADDING, height: 40))
        
        fullname_field.backgroundColor = rgba(0,0,0,0.2)
        fullname_field.insetsLayoutMarginsFromSafeArea = true
        fullname_field.textColor = .white
        fullname_field.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        fullname_field.layer.cornerRadius = 5
        view.addSubview(fullname_field)
        
        
        emailadd_field = UITextField(frame: CGRect(x: 2 * Utils.PADDING, y: fullname_field.frame.maxY + Utils.PADDING/2, width: view.frame.width - 4 * Utils.PADDING, height: 40))
        
        emailadd_field.backgroundColor = rgba(0,0,0,0.2)
        emailadd_field.insetsLayoutMarginsFromSafeArea = true
        emailadd_field.textColor = .white
        emailadd_field.attributedPlaceholder = NSAttributedString(string: "Email Address",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailadd_field.layer.cornerRadius = 5
        view.addSubview(emailadd_field)
        
        
        username_field = UITextField(frame: CGRect(x: 2 * Utils.PADDING, y: emailadd_field.frame.maxY + Utils.PADDING/2, width: view.frame.width - 4 * Utils.PADDING, height: 40))
        
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

        
        sign_up_button = UIButton(frame: CGRect(x: 4*Utils.PADDING, y: view.frame.height/1.33, width: view.frame.width - 8*Utils.PADDING, height: 40))
        sign_up_button.setTitle("Sign Up!", for: .normal)
        sign_up_button.backgroundColor = UIColor.flatGray

        view.addSubview(sign_up_button)
    }
    
}
