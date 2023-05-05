//
//  ClockAppViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 02/05/23.
//

import UIKit

class ClockAppViewController: UIViewController {

    @IBOutlet weak var timeLabel : UILabel!;
    @IBOutlet weak var dateLabel : UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ (_) in
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss a"
            let currentTime = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let currentDate = dateFormatter.string(from: date)
            
            
            self.timeLabel.text = currentTime
            self.dateLabel.text = currentDate
        }
    }
    

}
