//
//  Login-logic.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

extension LoginViewController {
    func connect_buttons() {
        sign_up_button.addTarget(self, action: #selector(go_to_signup), for: .touchUpInside)
    }
    
    @objc func get_email_login() {
        guard let username = username_field.text?.lowercased() else {
            return
        }
        let ref = Database.database().reference()
        let userRef = ref.child("users").child(username)
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let email = value?["email"] as? String ?? ""
            
            debugPrint("Got Email: " + email)
            
            self.login_with_email(email: email, usertext: username)
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func login_with_email(email: String, usertext: String) {
        advance_to_login.isUserInteractionEnabled = false
        
        guard let password = password_field.text else {
            advance_to_login.isUserInteractionEnabled = true
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error)
                self.advance_to_login.isUserInteractionEnabled = true
                return
            } else {
                self.currUsername = usertext
                self.performSegue(withIdentifier: "login2feed", sender: self)
            }
        })
    }
    
    
    
    func checkForAutoLogin() {
        
        if let user = Auth.auth().currentUser {
            let ref = Database.database().reference()
            let userRef = ref.child("uid_lookup").child(user.uid)
            userRef.observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let username = snapshot.value as! String
                
                debugPrint("Got Username: " + username)
                self.currUsername = username
                self.performSegue(withIdentifier: "login2feed", sender: self)
                self.advance_to_login.isUserInteractionEnabled = true
                // ...
            }) { (error) in
                print(error.localizedDescription)
                self.advance_to_login.isUserInteractionEnabled = true
            }
            
            
        }
    }
    
    @objc func go_to_signup() {
        performSegue(withIdentifier: "login2signup", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? AccountNavController {
            navVC.logged_in_user = currUsername
            currUsername = nil
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        username_field.text = ""
        password_field.text = ""
    }
}
