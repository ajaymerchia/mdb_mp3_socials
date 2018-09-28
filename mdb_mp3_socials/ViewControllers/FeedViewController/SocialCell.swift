//
//  SocialCell.swift
//  mdb_mp3_socials
//
//  Created by Ajay Raj Merchia on 9/28/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class SocialCell: UITableViewCell {

    var socialImage: UIImageView!
    var socialName: UILabel!
    var socialDesc: UILabel!
    
    var socialHost: UILabel!
    
    var interested: UIButton!
    var numInterested: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Utils.generateRandomColor()

        let width = contentView.frame.width
        
        // Initialization code
        socialImage = UIImageView(frame: CGRect(x:0, y: Utils.PADDING, width: width+100, height: 150))
        socialImage.contentMode = .scaleToFill
        
        socialName = UILabel(frame: CGRect(x: 0, y: socialImage.frame.maxY, width: contentView.frame.width, height: 25))
        socialName.center = CGPoint(x: contentView.frame.width/2, y: socialName.frame.midY)
        
        socialDesc = UILabel(frame: CGRect(x: 0, y: socialName.frame.maxY, width: contentView.frame.width, height: 80))
        socialDesc.center = CGPoint(x: contentView.frame.width/2, y: socialDesc.frame.midY)
        socialDesc.numberOfLines = 2
        socialDesc.lineBreakMode = NSLineBreakMode.byWordWrapping

//        socialDesc.
        
        socialHost = UILabel(frame: CGRect(x: 0, y: socialDesc.frame.maxY , width: contentView.frame.width, height: 20))
        socialHost.center = CGPoint(x: contentView.frame.width/2, y: socialHost.frame.midY)
        
        interested = UIButton(frame: CGRect(x: 0, y: socialHost.frame.maxY, width: contentView.frame.width, height: 30))
        interested.setTitle("interested", for: .normal)
        
        numInterested = UILabel(frame: CGRect(x: 0, y: interested.frame.maxY, width: 40, height: 25))
        
        
        contentView.addSubview(socialImage)
        contentView.addSubview(socialName)
        contentView.addSubview(socialDesc)
        contentView.addSubview(socialHost)
        contentView.addSubview(interested)
        contentView.addSubview(numInterested)
        
    }
    
    func initialCellFrom(event: Event) {
        socialImage.image = event.image
        socialName.text = event.title
        socialDesc.text = event.description
        socialHost.text = event.poster
        numInterested.text = "\(event.numInterested ?? 0)"
        
        
    }

}
