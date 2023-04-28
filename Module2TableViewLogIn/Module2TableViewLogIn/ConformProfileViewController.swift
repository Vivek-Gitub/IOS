//
//  ConformProfileViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 27/04/23.
//

import UIKit

protocol ConformProfileViewControllerDelwgates{
    func selectedDetails(array: [String])
}

class ConformProfileViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    

    var delegate : ConformProfileViewControllerDelwgates?
    @IBOutlet weak var tableView: UITableView!
    
    let dunamicButton = UIButton(type: UIButton.ButtonType.system)
    
    var yourArray = [String]()
    
    struct profileData{
        let profileTitle : String
        let profileText : String
    }
    
    let profileDataArray : [profileData] = [
        
        profileData(profileTitle : "Name", profileText: "Vivek patel"),
        profileData(profileTitle : "E mail", profileText: "Vivekpatel9871@gmail.com"),
        profileData(profileTitle : "Contact No", profileText: "9871983279"),
        profileData(profileTitle : "Address", profileText: "Lucknow"),
        profileData(profileTitle : "DOB", profileText: "25/05/2002")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileData = profileDataArray[indexPath.row]
        let profileCell =  tableView.dequeueReusableCell(withIdentifier: "renamecell", for: indexPath) as! ConfirmProfileTableViewCell
        profileCell.confirmprofileTabel.text = profileData.profileTitle
        
        profileCell.confirmProfileTextField.text = profileData.profileText
        profileCell.confirmProfileTextField.tag = indexPath.row // set a tag to identity  the text field
        return profileCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
            var footerView : UIView?
            
            
           
            
            footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
            
            footerView?.backgroundColor = UIColor.systemBlue
        
            dunamicButton.backgroundColor = UIColor.white
            
            dunamicButton.setTitle("Done", for: UIControl.State.normal)
            
            
            dunamicButton.frame = CGRectMake(140, 0, 100, 50)
            
            dunamicButton.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            

            footerView?.addSubview(dunamicButton)
            
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath) as! ConfirmProfileTableViewCell
        let text = cell.confirmProfileTextField.text
//        yourArray.append(text ?? "")
        
        print(text)
    }
    
    @objc  func buttonTouched(){
        
        print(yourArray)
        print("click")
        
        self.delegate?.selectedDetails(array: yourArray)
        self.dismiss(animated: true)

        
    }
    

}

extension ConformProfileViewController :UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let index = textField.tag
        
        if let text = textField.text{
            let newText = (text as NSString).replacingCharacters(in: range, with: string)
            yourArray[index] = newText
        }
        return true
    }
}
