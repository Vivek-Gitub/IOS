//
//  SearchViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 01/05/23.
//

import UIKit

class SearchViewController: UIViewController {


    @IBOutlet weak var tableSearch: UITableView!
    
    let allAvenger = ["iron man" ,"ameriac", "hawk eyye", "Batman", "spider man"]
    
    var filteravenger = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filteravenger = allAvenger
        tableSearch.dataSource =  self
        tableSearch.delegate = self
        tableSearch.reloadData()
        // Do any additional setup after loading the view.
    }
    //MARK: - Search handeler
    @IBAction func search(_ sender: UITextField) {
        if let Searchtext = sender.text{
            filteravenger = Searchtext.isEmpty ? allAvenger : allAvenger.filter{$0.lowercased().contains(Searchtext.lowercased())}
            tableSearch.reloadData()
        }
    }
    
    
}



extension SearchViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteravenger.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableSearch.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        cell.searchLabel.text = filteravenger[indexPath.row]
        return cell
        
    }
    
    
}
