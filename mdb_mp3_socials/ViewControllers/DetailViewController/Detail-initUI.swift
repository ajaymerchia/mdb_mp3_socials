//
//  Detail-initUI.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/28/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
    func initUI() {
        currUser = (self.navigationController as! AccountNavController).logged_in_user!
        init_img()
        init_text()
        init_buttons()
        
        if event.interestedMembers.contains(currUser) {
            interestButton.isSelected = true
        }
        
    }
    
    func init_img() {
        event_img = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        event_img.contentMode = .scaleToFill
        event_img.image = event.image
        
        view.addSubview(event_img)
    }
    
    func init_text() {
        event_title = UILabel(frame:CGRect(x: 0, y: 250, width: view.frame.width, height: 20))
        event_title.text = event.title
        
        event_description = UILabel(frame:CGRect(x: 0, y: 280, width: view.frame.width, height: 20))
        event_description.text = event.description
        
        event_poster = UILabel(frame:CGRect(x: 0, y: 310, width: view.frame.width, height: 20))
        event_poster.text = event.poster
        
        interested_list = UILabel(frame:CGRect(x: 0, y: 340, width: view.frame.width, height: 20))
        interested_list.text = "Interested: " + (event.interestedMembers).joined(separator: ", ")
        
        num_interested_label = UILabel(frame:CGRect(x: 0, y: 370, width: view.frame.width, height: 20))
        num_interested_label.text = "\(event.numInterested ?? 0)"
        
        
        view.addSubview(event_title)
        view.addSubview(event_description)
        view.addSubview(event_poster)
        view.addSubview(interested_list)
        view.addSubview(num_interested_label)
        
    }
    
    func init_buttons() {
        interestButton = UIButton(frame: CGRect(x: Utils.PADDING, y: 400, width: (view.frame.width-2*Utils.PADDING), height: 50))
        interestButton.setTitle("♡ Interested", for: .normal)
        interestButton.setTitle("❤️ Interested", for: .selected)
        interestButton.addTarget(self, action: #selector(updateInterestCount), for: .touchUpInside)
        interestButton.backgroundColor = UIColor.flatSkyBlue
        view.addSubview(interestButton)
    }
}
