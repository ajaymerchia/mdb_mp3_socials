//
//  NewSocial-imagepicker.swift
//  
//
//  Created by Ajay Raj Merchia on 9/27/18.
//

import Foundation
import UIKit

extension NewSocialViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func createImagePicker() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            picker.sourceType = .camera
            picker.allowsEditing = true
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(picker, animated: true, completion: nil)
        }
        else {
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){

        debugPrint("hello world")
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage


        eventImageView.contentMode = .scaleAspectFit
        eventImageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

}
