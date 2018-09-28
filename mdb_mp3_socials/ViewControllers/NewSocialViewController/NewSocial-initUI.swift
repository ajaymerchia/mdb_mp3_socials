//
//  NewSocial-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension NewSocialViewController {
    func initUI() {
        init_nav()
        init_textinput()
        init_datepicker()
        init_photopicker()
        init_button()
    }
    
    func init_nav() {
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: Utils.PADDING, width: view.frame.width, height: 50));
        navbar.tintColor = UIColor.flatGray
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        
        self.view.addSubview(navbar)
        
        let navItem = UINavigationItem(title: "")
        let navBarbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(go_back))
        navItem.leftBarButtonItem = navBarbutton
        
        navbar.items = [navItem]
    }
    
    @objc func go_back() {
        self.dismiss(animated: true, completion: {})
    }
    
    func init_textinput() {
        eventNameField = UITextField(frame: CGRect(x: 0, y: 150, width: view.frame.width, height: 50))
        eventNameField.placeholder = "Event Name"
        eventNameField.backgroundColor = UIColor.flatSkyBlue
        view.addSubview(eventNameField)
        
        eventDescField = UITextView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 50))
        eventDescField.delegate = self
        eventDescField.text = "Event Description"
        eventDescField.textColor = UIColor.lightGray
        eventDescField.backgroundColor = UIColor.flatSkyBlue
        eventDescField.textContainer.maximumNumberOfLines = 2
        eventDescField.textContainer.lineBreakMode = .byTruncatingTail

        view.addSubview(eventDescField)
    }
    
    func init_datepicker() {
        eventDateField = UIDatePicker(frame: CGRect(x: 50, y: 300, width: view.frame.width-100, height: 100))
        
        eventDateField.backgroundColor = rgba(200,200,200,1)
        view.addSubview(eventDateField)
    }
    
    func init_photopicker() {
        eventImgPicker = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        eventImgPicker.setTitle("add photo", for: .normal)
        eventImgPicker.backgroundColor = .red
        eventImgPicker.addTarget(self, action: #selector(createImagePicker), for: .touchUpInside)
        view.addSubview(eventImgPicker)
        
        
        eventImageView = UIImageView(frame: CGRect(x: 100, y: 500, width: 300, height: 300))
        view.addSubview(eventImageView)
    }
    
    func init_button() {
        createEvent = UIButton(frame: CGRect(x: 50, y: view.frame.height-50, width: view.frame.width-100, height: 50))
        createEvent.backgroundColor = UIColor.flatLime
        createEvent.setTitle("Create Event", for: .normal)
        createEvent.addTarget(self, action: #selector(createTheEvent), for: .touchUpInside)
        view.addSubview(createEvent)
    }
    
}
