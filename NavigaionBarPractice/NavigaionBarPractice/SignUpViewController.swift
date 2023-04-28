//
//  SignUpViewController.swift
//  NavigaionBarPractice
//
//  Created by Vivek Patel on 19/04/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailSignInTextField: UITextField!
    @IBOutlet weak var passwordSignInTextField: UITextField!
    @IBOutlet weak var conformPasswordSignInTextField: UITextField!
    
    var email = ""
    var password = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailSignInTextField.text = "email \(email)"
        passwordSignInTextField.text = "pa"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInSubmitButtonAction(_ sender: Any) {
        
        let passSignIn = self.passwordSignInTextField.text ?? "";
        let conformPassSignIn=self.conformPasswordSignInTextField.text ?? "";
        
        //email field must contain @ and . symbols
        let emailSignIn = self.emailSignInTextField.text ?? "";
        
        if(passSignIn == "" || passSignIn == ""  || conformPassSignIn == ""){
            print("Field can not be empty");
        }else if(conformPassSignIn != passSignIn){
            print("password does not match!")
        }else if (!(emailSignIn.contains("@") && emailSignIn.contains("."))){
            print("Invalid email")
        }else{
            
            // this dismiss your view
            self.dismiss(animated: false, completion: nil)
            print("Sign in success")
        }
        
    }
    
    
}
