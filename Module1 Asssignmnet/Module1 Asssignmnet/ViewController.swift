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
   
    //Sign in text field and password
    @IBOutlet weak var emailSignInTextField: UITextField!
    @IBOutlet weak var passwordSignInTextField: UITextField!
    @IBOutlet weak var conformPasswordSignInTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    // Button of Sign in submit button
    @IBAction func signInSubmitButtonAction(_ sender: Any) {
        
        let passSignIn = self.passwordSignInTextField.text ?? "";
        let conformPassSignIn=self.conformPasswordSignInTextField.text ?? "";
        let emailSignIn = self.emailSignInTextField.text ?? "";
        
        if(passSignIn == "" || passSignIn == ""  || conformPassSignIn == ""){
            print("Field can not be empty");
        }else if(conformPassSignIn != passSignIn){
            print("password does not match!")
        }else if (!(emailSignIn.contains("@") && emailSignIn.contains("."))){
            print("Invalid email")
        }else{
            self.dismiss(animated: false, completion: nil)
            print("Sign in success")
        }
        
    }
    
    
    
    
    // define IBAction
    //Present viewcontroller =>  push VC
    //dismiss VC  => pop VC
    
    
    
}

