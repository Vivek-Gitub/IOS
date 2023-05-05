//
//  ViewController.swift
//  PaginationPractice
//
//  Created by Vivek Patel on 03/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var personArray:[String] = ["aa","bb","cc","dd","ee","ff","gg","hh","aa","bb","cc","dd","ee","ff","gg","hh","aa","bb","cc","dd","ee","ff","gg","hh","aa","bb","cc","dd","ee","ff","gg","hh","aa","bb","cc","dd","ee","ff","gg","hh","aa","bb","cc","dd","ee","ff","gg","hh"]
    
    var currentPage = 1
    var totalPages = 1  
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self

        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
         
    }
    @objc func loadData(){
       currentPage += 1
       refreshControl.endRefreshing()
   }

   

}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PageTableViewCell
            // Configure cell with item data
        cell.label.text = personArray[indexPath.row]
        cell.label.font = UIFont(name: "Helvetica Neue", size: 23)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50// set height of each row to 50 points
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == personArray.count - 1, currentPage < totalPages {
            loadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
}
