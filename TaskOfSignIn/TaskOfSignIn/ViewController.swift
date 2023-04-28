//
//  ViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 18/04/23.
//

import UIKit

//class tabController: UITabBarController{
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // create instance of class
//
//        let homeview = ViewController()
//        let signIn = SignUpViewController()
//
//        self.setViewControllers([homeview , signIn], animated: true)
//    }
//}

class ViewController: UIViewController {
    
    
   // let tabBar = UITabBarController()
    
    @IBOutlet weak var emailFieldLogIn: UITextField!
    
    @IBOutlet weak var passwordFieldLogIn: UITextField!
    
    @IBOutlet weak var loginButtonRadius: UIButton!
    
    @IBOutlet weak var forgetButtonRound: UIButton!
    
    //check box
    @IBOutlet weak var checkBoxButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButtonRadius.layer.cornerRadius = 20;
        forgetButtonRound.layer.cornerRadius = 10;
        
//        tab()
    }
    
//    func tab(){
//        let firstVC = SignUpViewController()
//        //firstVC.view.backgroundColor = .lightGray
//        let second = ForgetViewController()
//        //second.view.backgroundColor = .blue
//
//
//        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
//        let item2 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
//
//        firstVC.tabBarItem = item1
//        second.tabBarItem = item2
//
//        tabBar.viewControllers = [firstVC,second]
//
//        self.view.addSubview(tabBar.view)
//
//    }
    
    // function for dismiss keypad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

    // Function for login button in login screen
    @IBAction func loginButtonAction(_ sender: Any) {
        let emailTextFieldLogIn = self.emailFieldLogIn.text ?? ""
        let passwordTextFieldLogIn = self.passwordFieldLogIn.text ?? ""
        
        
        
        print("Email ID is \(emailTextFieldLogIn) and password is \(passwordTextFieldLogIn)")
        
        
        /* 27 April UserDefualts.shared the "SavedEmail" is key in "SignUpViewController" to match with logi data */
        
        if(emailFieldLogIn.text == UserDefaults.standard.value(forKey: "SavedEmail") as? String && passwordFieldLogIn.text == UserDefaults.standard.value(forKey: "SavedPassword") as? String){
            print("Email and Password match successsfully")
            
            //here we open "ImagePickerActionSheetViewController"
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signView = mainStoryboard.instantiateViewController(withIdentifier: "ImagePickerActionSheetViewController") as! ImagePickerActionSheetViewController
            
            self.present(signView, animated: true)
            
        }else{
            print("Wrong  failure")
        }
        
           /* ######     END   ############*/
    }
    
    //sign up button on sign In Screen
    @IBAction func signInButtonAction(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        signView.delegate = self
        self.present(signView, animated: true)
    }
    
    // forget button on Login page
    @IBAction func forgetButtonAction(_ sender: Any) {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "ForgetViewController") as! ForgetViewController
        
        self.present(signView, animated: true)
        
    }
    
    // Function for checkBox
    @IBAction func changeStateCheckBox(_ sender: Any) {
        
//        if self.checkBoxButton.isSelected{
//            self.checkBoxButton.isSelected = false
//            self.checkBoxButton.setImage(UIImage(named: "icons8-unchecked-checkbox-50"), for: .normal)
//        }else{
//            self.checkBoxButton.isSelected=true
//            self.checkBoxButton.setImage(UIImage(named: "icons8-checked-checkbox-60"),for: .normal)
//        }
        self.checkBoxButton.isSelected = !self.checkBoxButton.isSelected
        self.checkBoxButton.setImage(self.checkBoxButton.isSelected ? UIImage(named: "icons8-unchecked-checkbox-50") : UIImage(named: "icons8-checked-checkbox-60"),for: .normal)
    }
    
}

//from signUPViewController
extension ViewController : SignUpViewControllerDelegates{
    func selectedEmailPassword(emailId :String ,password:String){
        emailFieldLogIn.text = emailId
        passwordFieldLogIn.text = password
    }
}
