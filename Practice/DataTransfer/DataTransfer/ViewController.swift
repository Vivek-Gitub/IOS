//
//  ViewController.swift
//  DataTransfer
//
//  Created by Vivek Patel on 17/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button1(_ sender: UIButton) {
        let text = self.textField1.text ?? "";
        print(text)
    }
    
}

