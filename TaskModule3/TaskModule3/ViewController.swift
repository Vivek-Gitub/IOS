//
//  ViewController.swift
//  TaskModule3
//
//  Created by Vivek Patel on 29/04/23.
//

import UIKit
import CoreData




class ViewController: UIViewController {

    @IBOutlet weak var productNameTextField: UITextField!
    
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    @IBOutlet weak var productPriceTextField: UITextField!
    
    @IBOutlet weak var productDateTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    

    @IBAction func addProductButton(_ sender: Any) {
        
//        print(productNameTextField.text?.isEmpty)
        var productName = productNameTextField.text
        var productDescription = productDescriptionTextView.text
        var productPrice = productPriceTextField.text
        var productDate = productDateTextField.text
        
        if(productName!.isEmpty || productDescription!.isEmpty || productPrice!.isEmpty || productDate!.isEmpty){
            let alert = UIAlertController(title: "Field cannot be empty", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction)in }))
            self.present(alert,animated: true)
        }else{
           
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let productEntity = ProductData(context: context)
            productEntity.name = productName
            productEntity.productDesc = productDescription
            productEntity.expirtyDate = productDate
            
            do{
                try context.save()
                
                let alert = UIAlertController(title: "saved Successfully", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction)in }))
                productName = ""
                productDate = ""
                productPrice = ""
                productDescription = ""
                
                
                print("add successfully")
            }catch let error as Error{
                print("Failed to save =====" ,error.localizedDescription)
            }
        }
        
    }
    
}


extension ViewController: UITextFieldDelegate{
    
    
}
