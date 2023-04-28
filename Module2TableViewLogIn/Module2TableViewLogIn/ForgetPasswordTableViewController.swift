//
//  ForgetPasswordTableViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 22/04/23.
//

import UIKit

class ForgetPasswordTableViewController: UITableViewController {

    
    @IBOutlet weak var emailPhoneNumberTextField: UITextField!
    
    @IBOutlet weak var otpTextField: UITextField!
    
    @IBOutlet weak var otpViewScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpViewScreen.isHidden = true
        
    }
    @IBAction func forgetButtonActtion(_ sender: Any) {
        
        let emailOrPhoneText = emailPhoneNumberTextField.text ?? ""
        
        if(emailOrPhoneText != ""){
            otpViewScreen.isHidden = false
        }else{
            print("field can not be empty")
        }
        
        
    }
    
    @IBAction func checkOtpActionButton(_ sender: Any) {
        
        let otpText = otpTextField.text ?? ""
        
        if(otpText == "1234"){
            print(" OTP right")
            
            let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let confirmView = mainStoryBoard.instantiateViewController(withIdentifier: "ForgetConfirmTableViewController") as! ForgetConfirmTableViewController
                
            self.navigationController!.pushViewController(confirmView, animated: true)
        
        //self.present(confirmView,animated: true)
            
            
        }
        else{
            print("OTP wrong")
        }
    }
    
    // for dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
