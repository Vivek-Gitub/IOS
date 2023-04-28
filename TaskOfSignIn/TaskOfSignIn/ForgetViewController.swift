//
//  ForgetViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 18/04/23.
//

import UIKit

class ForgetViewController: UIViewController {

    @IBOutlet weak var emailTextFieldForget: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func forgetActionButton(_ sender: Any) {
        let emailForget = self.emailTextFieldForget.text ?? ""
        
        print("Email is \(emailForget)")
    }
    
    // function for dismiss keypad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
