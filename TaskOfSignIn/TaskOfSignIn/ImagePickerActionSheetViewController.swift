//
//  ImagePickerActionSheetViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 25/04/23.
//

import UIKit

class ImagePickerActionSheetViewController: UIViewController,  UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var image: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func imageActionPerformed(_ sender: Any) {
//        imagePicker.modalPresentationStyle = .currentContext
//        imagePicker.delegate = self
//        self.present(imagePicker,animated: true)
        
        let alert = UIAlertController(title: "select", message: "for iamge selection", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(UIAlertAction)in // gallery button
           // print("user click gallery button")
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(UIAlertAction)in //open camera
            //print("user click camera button")
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction)in
            print("user click dismiss button")
        }))
        self.present(alert, animated: true, completion: {print("com")})
    }
    
}

extension ImagePickerActionSheetViewController : UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        
        image.image = tempImage
        
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true) // it dim
        print("cancel picking image")
        
        let alert = UIAlertController(title: "Cancelled picking image", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction)in print("yes clicked")}))

        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (UIAlertAction)in }))
        self.present(alert,animated: true)
    }
}
