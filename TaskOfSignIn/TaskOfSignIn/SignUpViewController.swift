//
//  SignUpViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 18/04/23.
//

import UIKit

// here we make custom delegate
protocol SignUpViewControllerDelegates{
    func selectedEmailPassword(emailId :String ,password:String)
}

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // here we make variable of SignUpViewControllerDelegates protocol for accessing its variale and function
    var delegate : SignUpViewControllerDelegates?
    
    
    @IBOutlet weak var nameTextFieldSignUp: UITextField!
    
    @IBOutlet weak var emailTextFieldSignUp: UITextField!
    
    @IBOutlet weak var phoneTextFieldSignUp: UITextField!
    
    @IBOutlet weak var passwordTextFieldSignUp: UITextField!
    
    @IBOutlet weak var confirmtextFieldSignIn: UITextField!
    
    // this text field work with picker selcetion it can be hidden and  visbile
    @IBOutlet weak var dateTextField: UITextField!
    
    
    // slider
    @IBOutlet weak var sliderAcademicSignIn: UISlider!
    
    //academic label
    @IBOutlet weak var acdemicLabelText: UILabel!
    
    //This is for slider
    @IBOutlet weak var switchbuttonDateField: UISwitch!
    
    // this is for selecting date and time
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // inital we give academic label as ""
        acdemicLabelText?.text = ""
        
        // inital slider is off
        switchbuttonDateField?.isOn = false
        
        // initial d/o/b is hidden
        dateTextField?.isHidden = true
        
        // this is for hidden date picker at inital state
        datePicker?.isHidden = true
        
        //
        datePicker?.datePickerMode = .date
        
        //dateTextField.delegate = self
    }
    
    
    // function for dismiss keypad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // function for sign up button
    @IBAction func signUpActionButton(_ sender: Any) {
        
        let name=self.nameTextFieldSignUp.text ?? ""
        let emailSignUp = self.emailTextFieldSignUp.text ?? ""
        let phone = self.phoneTextFieldSignUp.text ?? ""
        let passwordSignUp = self.passwordTextFieldSignUp.text ?? ""
        let confirmPass = self.confirmtextFieldSignIn.text ?? ""
        
        let dateOfBirth = self.dateTextField.text ?? ""
        
       // print(name,emailSignUp,phone,passwordSignUp,confirmPass,dateOfBirth)
//        print("name is \(name) and date of birth is \(dateOfBirth)")
        
        
        
        // this is for DashBoardViewController
//        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let dashboardStoryboard = mainStoryboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
//        self.present(dashboardStoryboard, animated: true)
        
        
        /* 27 April store data in local machine using "User result" */
        UserDefaults.standard.set(emailTextFieldSignUp.text, forKey: "SavedEmail")
        UserDefaults.standard.set(passwordTextFieldSignUp.text, forKey: "SavedPassword")
        UserDefaults.standard.synchronize()
        
       //  reterive data
        print(UserDefaults.standard.value(forKey: "SavedEmail" ) ?? "")
        print(UserDefaults.standard.value(forKey: "SavedPassword" ) ?? "")
        
        /* ########################## END ###############*/
        
        
    }
    
    
    //  button for opening log in screen
    @IBAction func logInActionButtonSignUp(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(signView, animated: true)
        
    }
    
    // Funtion for slider
    @IBAction func sliderActionPerformed(_ sender: UISlider) {
        
        let slideraValue=Int(self.sliderAcademicSignIn.value)
        
        if(slideraValue >= 90){
            acdemicLabelText.text = "Brilliant"
        }else if(slideraValue > 70 && slideraValue < 90){
            acdemicLabelText.text = "good"
        }else if(slideraValue > 40 && slideraValue < 70){
            acdemicLabelText.text = "average"
        }else{
            acdemicLabelText.text = "below average"
        }
        
    }
    
    
    // button function of switch button for hiding and showing date picker and D/O/B text field
    @IBAction func sliderDateAction(_ sender: Any) {
        //        print("poistion are \(switchbuttonDateField.isOn)")
        
        if (switchbuttonDateField.isOn){
            dateTextField.isHidden = false
            datePicker.isHidden = false
        }else{
            datePicker.isHidden = true
            dateTextField.isHidden = true
        }
        
    }
    
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//            dateTextField.backgroundColor = .red
//            print("hello")
//
//        }
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            print("it is end")
//            dateTextField.backgroundColor = .blue
//        }
    
    
    // function for date picker
    @IBAction func dateSelectedByPicker(_ sender: Any) {
        print("date selected --- ",datePicker.date)
        
        // here we format data of date picker in string so we can store it in a text field
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let stringDate : String = dateFormatter.string(from: datePicker.date)
        
        dateTextField.text = stringDate
    }
    
    
    // back button
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        self.delegate?.selectedEmailPassword(emailId: emailTextFieldSignUp.text ?? "", password: passwordTextFieldSignUp.text ?? "")
        self.dismiss(animated: true)
    }
    
}
