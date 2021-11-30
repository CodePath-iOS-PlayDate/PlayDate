//
//  PhotoLibraryViewController.swift
//  PlayDate
//
//  Created by Gustavo Cornejo on 11/29/21.
//

import UIKit

class PhotoLibraryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //I don't really know how to connect thi without storyboard
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var pickedImage = false

    override func viewDidAppear(_ animated: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !pickedImage {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            pickedImage = true
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        profileImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
