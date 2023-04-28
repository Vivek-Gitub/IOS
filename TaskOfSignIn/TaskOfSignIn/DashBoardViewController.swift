//
//  DashBoardViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 20/04/23.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    // text field village with label village
    @IBOutlet weak var villageName: UITextField!
    
    // outlet of ui segment
    @IBOutlet weak var segmentControlClicked: UISegmentedControl!
    
    @IBOutlet weak var experienceTextField: UITextField!
    // outlet for view for seperience segment
    @IBOutlet weak var experienceSegmentView: UIView!
    
    // picker list of experience segment for show data
    @IBOutlet weak var pickerList: UIPickerView!
    
    
    let pickerListData = ["Fresher","Intermeddiate","Experience"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        experienceSegmentView.isHidden = true // at inital we want experience view segment is hidden
        
        // important step of give data in pickerview field
        pickerList.delegate = self
        pickerList.dataSource = self
    }
    
    
    // segment selection option
    @IBAction func segmentControlActionButton(_ sender: Any) {
        
        let village = villageName.text ?? "";
        
        
        switch(segmentControlClicked.selectedSegmentIndex){
            
        case 0:
            print("Home is selected")
            print("Village name is \(village)")
            experienceSegmentView.isHidden = true
            
            break
        case 1:
            print("Experience is selected")
            experienceSegmentView.isHidden = false // for show experience view on experience segment
            break
        case 2:
            print("Profile is selected")
            //self.dismiss(animated: true)
            experienceSegmentView.isHidden = true // hidden experience view
            break
        default:
            print("this is default value")
        }
    }
    

}

//for adding data in UIPickerView we need delegate and datasource and we add like this or we have anoteher way
//MARK: Picker Delegate & Datasource

extension DashBoardViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerListData.count
    }
    
    // function for adding data in picker view from pickerListData
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerListData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        experienceTextField.text = pickerListData[row]
        //print("selected value === ",pickerListData[row])
    }
    
}
