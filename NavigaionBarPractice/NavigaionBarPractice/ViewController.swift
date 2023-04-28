//
//  ViewController.swift
//  NavigaionBarPractice
//
//  Created by Vivek Patel on 14/04/23.
//

import UIKit

class ViewController: UIViewController {
    //Login text field and password
    @IBOutlet weak var emailLogInTextField: UITextField!
    @IBOutlet weak var passwordLogInTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Here we add some icon
        //        emailLogInTextField.addImageTextField(ImageViewNamed: "emailIcon");
        //        passwordLogInTextField.addImageTextField(ImageViewNamed: "passwordIcon");
        
        
    }
    
    // Function for keyboard dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    // login submit button
    @IBAction func logInSubmitButtonAction(_ sender: Any) {
        
        let passLogIn = self.passwordLogInTextField.text ?? "";
        let emailLogIn = self.emailLogInTextField.text ?? "";
        
        if(emailLogIn == "testEmail@gmail.com" && passLogIn == "123456789"){
            print("Success ! you are Log In")
        }else if(passLogIn == "" || emailLogIn == ""){
            print("Fields can not be empty")
        }else{
            print("Failure ! Wrong email Id or Password ")
        }
    }
    
   
    @IBAction func signinButtonLogIn(_ sender: Any) {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signView, animated: true)
        
        self.navigationController?.pushViewController(signView, animated: true)
    }
    
    
}
//
//extension UITextField{
//
//    func addImageTextField(ImageViewNamed : String){
//        let ImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
//        ImageView.image = UIImage(named: ImageViewNamed)
//        let imageViewContainerView = UIView( frame : CGRect(x: 0, y: 0, width: 55, height: 40))
//
//        imageViewContainerView.addSubview(ImageView)
//        leftView = imageViewContainerView
//        leftViewMode = .always
//    }
//}

