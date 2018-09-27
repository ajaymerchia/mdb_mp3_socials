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
        login_button.addTarget(self, action: #selector(get_email_login), for: .touchUpInside)
        sign_up_button.addTarget(self, action: #selector(go_to_signup), for: .touchUpInside)
    }
    
    @objc func get_email_login() {
        guard let username = username_field.text else {
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
        guard let password = password_field.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print(error)
//                self.displayAlert(title: "There was an error", message: "Trying to sign you in")
                return
            } else {
                self.currUsername = usertext
                self.performSegue(withIdentifier: "login2feed", sender: self)
            }
        })
    }
    
    @objc func go_to_signup() {
        performSegue(withIdentifier: "login2signup", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("Called")
        if currUsername != nil {
            performSegue(withIdentifier: "login2feed", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FeedViewController {
            let feed = segue.destination as! FeedViewController
            feed.logged_in_user = currUsername
        }
    }
}
