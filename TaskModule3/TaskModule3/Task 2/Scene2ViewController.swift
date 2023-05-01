//
//  Scene2ViewController.swift
//  TaskModule3
//
//  Created by Vivek Patel on 29/04/23.
//

import UIKit

class Scene2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionButton(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "Scene3ViewController") as! Scene3ViewController
        self.present(signView, animated: true)
    }
}
