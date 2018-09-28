//
//  Event.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/27/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

class Event {
    var event_id: String!
    
    var title: String!
    var description: String!
    var date: Date!
    
    var poster: String!
    var numInterested: Int!
    var interestedMembers: [String]!
    
    var imageRoute: String!
    var image: UIImage!
    
    init(id:String, dict: [String: Any]) {
        self.event_id = id
        
        if let title = dict["title"] as? String {
            self.title = title
        } else {
            self.title = "Event"
        }
        if let description = dict["description"] as? String {
            self.description = description
        } else {
            self.description = "Details to come."
        }
        if let date = dict["date"] as? String {
            self.date = date.toDateTime()
        } else {
            self.date = Date.init()
        }
        if let poster = dict["poster"] as? String {
            self.poster = poster
        } else {
            self.poster = "Unknown"
        }
        if let numInterested = dict["numInterested"] as? Int {
            self.numInterested = numInterested
        } else {
            self.numInterested = 0
        }
        if let interestedMembers = dict["interestedMembers"] as? [String] {
            self.interestedMembers = interestedMembers
        } else {
            self.interestedMembers = []
        }
        
        self.image = UIImage(named: "default_event")
        self.imageRoute = id
        assignImageForFile(named: id)
    }
    
    func assignImageForFile(named: String) {
        let image_directory = Storage.storage().reference().child("images")
        let imageFile = image_directory.child(named)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        imageFile.getData(maxSize: 2 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                debugPrint("Error with file retrieve", error)
                self.imageRoute = "DEFAULT"
                self.image = UIImage(named: "default_event")
            } else {
                self.image = UIImage(data: data!)
            }
        }
    }
    
    
    
    
    
}
