//
//  LogInTableViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 22/04/23.
//

import UIKit

class LogInTableViewController: UITableViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkBoxButton.isSelected = false
        
//        self.email.isEnabled = false
        

    }
    
    
    
    
    
    // fon for check box selection
    @IBAction func changeStateCheckBox(_ sender: Any) {
        
        self.checkBoxButton.isSelected = !self.checkBoxButton.isSelected
        
        self.checkBoxButton.setImage(self.checkBoxButton.isSelected ? UIImage(named: "icons8-unchecked-checkbox-50") : UIImage(named: "icons8-checked-checkbox-60"), for:  .normal)
    }
    
    @IBAction func forgetPasswordActionButton(_ sender: Any) {
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let forgetView = mainStoryBoard.instantiateViewController(withIdentifier: "ForgetPasswordTableViewController") as! ForgetPasswordTableViewController
        
        
       // self.present(forgetView,animated: true) // it is of push up and down
        
        self.navigationController!.pushViewController(forgetView, animated: true)
    }
    @IBAction func logInActionButton(_ sender: Any) {
        
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let forgetView = mainStoryBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        
       // self.present(forgetView,animated: true) // it is of push up and down
        
        self.navigationController!.pushViewController(forgetView, animated: true)
    }
    
    
    // for dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
