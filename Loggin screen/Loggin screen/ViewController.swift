//
//  ViewController.swift
//  Loggin screen
//
//  Created by Vivek Patel on 11/04/23.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var textFieldUserId: UITextField!
    
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }

    @IBAction func buttonSignIn(_ sender: Any) {
        let user=self.textFieldUserId.text ?? "";
        let pass=self.textFieldPassword.text ?? "";
        if(user=="" && pass==""){
            print("please enter id and password")
        }else if(user == "sdirectBatch" && pass == "2023"){
            
            print(user + " is a part of Sdirect Batch");
            
        }
        else{
            print("You are not part of Sdirect Batch");
        }
        
    }
    
}

