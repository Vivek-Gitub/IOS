//
//  ViewController.swift
//  coreDataTutorial
//
//  Created by Vivek Patel on 28/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let manager = DataBaseManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func addUsersData(name :String, emailID :String, password :String){
        
    }
    
    
    
    @IBAction func addDataInTable(_ sender: Any) {
        let userName = nameTextField.text ?? ""
        let userEmail = emailTextfield.text ?? ""
        let userPassword = passwordTextField.text ?? ""
        
        let user = UserModel(name: userName, email: userEmail, password: userPassword)
        
        manager.addUser(user)
        
        
    }
    
    @IBAction func fetchDataButton(_ sender: Any) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "UsersDetails", in: managedContext)!
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersDetails")
        do{
            let result = try managedContext.fetch(fetchRequest)
            print("List of data ===",result)
        }catch let error as NSError{
            print("failed to fetch ===" ,error.localizedDescription)
        }
    }
    
    
    

}

