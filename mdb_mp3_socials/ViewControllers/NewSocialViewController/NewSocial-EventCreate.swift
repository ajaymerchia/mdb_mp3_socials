//
//  NewSocial-EventCreate.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

extension NewSocialViewController {
    @objc func createTheEvent() {
        var event_entry: [String: Any] = [:]
        
        event_entry["title"] = eventNameField.text!
        event_entry["description"] = eventDescField.text!
        event_entry["date"] = eventDateField.date.description
        
        event_entry["poster"] = (self.presentingViewController as? AccountNavController)?.logged_in_user
        
        event_entry["numInterested"] = 0
        event_entry["interestedMembers"] = []
        
        let event_id = String(format:"%02X", eventNameField.text!.hashValue) + String(format: "%02X", Date.init().description.hashValue)
        
        event_entry["id"] = event_id
        
        
        
        let image_directory = Storage.storage().reference().child("images")
        
        let photoRef = image_directory.child(event_id)
        
        guard let photoData = eventImageView.image?.jpegData(compressionQuality: 0.7) else {
            return
        }

        
        photoRef.putData(photoData, metadata: nil) { (metadata, error) in
            guard metadata != nil else {
                // Uh-oh, an error occurred!
                debugPrint("error1")
                return
            }
            // Metadata contains file metadata such as size, content-type.
//            let size = metadata.size
            // You can also access to download URL after upload.
            photoRef.downloadURL { (url, error) in
                guard url != nil else {
                    // Uh-oh, an error occurred!
                    debugPrint("error2")
                    return
                }
                self.pushEventObjectToDatabase(object: event_entry)
            }
        }
        
        
        debugPrint(event_entry)
    }
    
    func pushEventObjectToDatabase(object: [String: Any]) {
        let ref = Database.database().reference()
        let userRef = ref.child("events").child(object["id"] as! String)
        
        userRef.updateChildValues(object, withCompletionBlock: { (error, ref) in
            if error != nil {
                return
            } else {
                self.dismiss(animated: true, completion: {})
            }
        })
    }
    
    
}


