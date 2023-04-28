//
//  DashboardViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 22/04/23.
//

import UIKit

class DashboardViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var segmentAction: UISegmentedControl!
    
    @IBOutlet weak var table: UITableView!
    
    
    @IBOutlet weak var tableprofile2: UITableView!
    
    
    let dunamicButton = UIButton(type: UIButton.ButtonType.system)
    
    // it is structure of cell
    struct websiteData{
        let title : String
        let imageName : String
        let id : String
    }
    
    struct profileData{
        var profileTitle : String
        var profileText : String
    }
    
    
    
    
    let data : [websiteData] = [
        websiteData(title: "Apple", imageName: "dehradun" ,id: "12"),
        websiteData(title: "Samsung", imageName: "download", id: "12"),
        websiteData(title: "Nokia", imageName: "download 2" ,id: "423"),
        websiteData(title: "BlcakBerry", imageName: "download 3", id: "82"),
        websiteData(title: "Realme", imageName: "download 4", id: "913"),
        websiteData(title: "MI", imageName: "download 5", id: "613")
        
    ]
    
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
        table.dataSource = self
        table.delegate = self
        
        tableprofile2.isHidden = true
        
        
        tableprofile2.dataSource = self
        tableprofile2.delegate = self
        
        
        
    }
    
    //    private func registerTableViewTable(){
    //        let textFieldCell = UINib(nibName: "CustomTableViewCellProfile", bundle: nil)
    //        self.progileTableView.register(textFieldCell,forCellReuseIdentifier: "CustomTableViewCellProfile")
    //    }
    
    @IBAction func segemntControlActionButton(_ sender: Any) {
        
        
        switch(segmentAction.selectedSegmentIndex){
        case 0:
            table.isHidden = false
            tableprofile2.isHidden = true
            table.reloadData()
            break
        case 1:
            
            table.isHidden = true
            tableprofile2.isHidden = false
            tableprofile2.reloadData()
            break
        default:
            print("this is default value")
        }
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //tableView.reloadData()
        var returnValue = 0
        
        switch(segmentAction.selectedSegmentIndex){
        case 0:
            returnValue = data.count
            break
            
        case 1:
            
            returnValue = profileDataArray.count
            break
        default:
            print("this is default value")
        }
        
        return returnValue
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellType : UITableViewCell!
        
        //tableView.reloadData()
        
        
        switch(segmentAction.selectedSegmentIndex){
        case 0:
            
            let webData = data[indexPath.row]
            let cell =  table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            // now we assign your label and the imagelabel is from custom cell
            cell.imagelabels.text = webData.title
            cell.imageIcons.image = UIImage(named: webData.imageName)
            cell.iDNumber.text = webData.id
            cellType = cell
            break
            
        case 1:
            //tableprofile2.reloadData()
            // for profile segment
            let profileData = profileDataArray[indexPath.row]
            let profileCell =  tableprofile2.dequeueReusableCell(withIdentifier: "2ndprofile", for: indexPath) as! CusrtomableViewCell2profile
            profileCell.textField2profile.isUserInteractionEnabled = false
            profileCell.label2profile.text = profileData.profileTitle
            
            
            profileCell.textField2profile.text = profileData.profileText
            
            cellType = profileCell
            break
        default:
            print("this is default value")
        }
        //tableView.reloadData()
        
        return cellType
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var size : CGFloat!
        if(tableView == table){
            size = 140
        }else{
            size = 90
        }
        return size
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var sizeHeight : CGFloat! = 0.0
        if(tableView == tableprofile2){
            sizeHeight = 50
        }
        return sizeHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        var footerView : UIView?
        
        if(tableView == tableprofile2){
            
            
           
            
            footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
            
            footerView?.backgroundColor = UIColor.systemBlue
        
            dunamicButton.backgroundColor = UIColor.white
            
            dunamicButton.setTitle("Edit", for: UIControl.State.normal)
            
            
            dunamicButton.frame = CGRectMake(140, 0, 100, 50)
            
            dunamicButton.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            

            footerView?.addSubview(dunamicButton)
            
            
        }
        return footerView
        
    }
    
    @objc  func buttonTouched(){
        
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let confirmView = mainStoryBoard.instantiateViewController(withIdentifier: "ConformProfileViewController") as! ConformProfileViewController
        
        self.present(confirmView, animated: true)
        
    }
    
}


extension DashboardViewController : ConformProfileViewControllerDelwgates{
    func selectedDetails(array: [String]) {
        
        var i: Int = 0
         
        for var data   in profileDataArray{
            data.profileTitle = array[i]
            i = i+1
        }
    }
    
    
}
