//
//  ForgetConfirmTableViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 22/04/23.
//

import UIKit

class ForgetConfirmTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // for dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    

  
//    @IBAction func backButtonAction(_ sender: Any) {
//
//        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let confirmView = mainStoryBoard.instantiateViewController(withIdentifier: "LogInTableViewContxroller") as! LogInTableViewController
//
//
//        self.navigationController!.pushViewController(confirmView, animated: true)
//
//
//        //self.present(confirmView,animated: true)
//    }
}
