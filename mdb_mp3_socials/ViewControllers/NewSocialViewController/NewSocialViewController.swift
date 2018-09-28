//
//  NewSocialViewController.swift
//  
//
//  Created by Ajay Raj Merchia on 9/27/18.
//

import UIKit

class NewSocialViewController: UIViewController {

    var eventNameField: UITextField!
    var eventDescField: UITextView!
    var eventDateField: UIDatePicker!
    var eventImgPicker: UIButton!
    var eventImageView: UIImageView!
    
    var createEvent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
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
