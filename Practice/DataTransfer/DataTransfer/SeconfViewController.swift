//
//  SeconfViewController.swift
//  DataTransfer
//
//  Created by Vivek Patel on 17/04/23.
//

import UIKit

class SeconfViewController: UIViewController {

    @IBOutlet weak var textField2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func button2(_ sender: Any) {
        
        let text2=self.textField2.text ?? "";
        print(text2)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
