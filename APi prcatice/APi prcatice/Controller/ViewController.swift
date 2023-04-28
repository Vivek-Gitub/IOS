//
//  ViewController.swift
//  APi prcatice
//
//  Created by Vivek Patel on 26/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrMovieVM = [MovieViewModel]()
    
    //let parser = Parser()  // here we create instance of ParserAPI View Model
    override func viewDidLoad() {
        super.viewDidLoad()
        // parser.paerse()
        // Do any additional setup after loading the view.
        self.getData()
       
        // THIS IS FOR MODEL SERVICE AND SERVICE
        //        Service.sharedInstance.getAllMovieData {(movies,error) in
        //            if error == nil {
        //                print(movies)
        //            }
        
        
        
        
    }
    
    func getData(){
        
        Service.sharedInstance.getAllMovieData {(movies,error) in
            if error == nil {
                self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0)}) ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let MVM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = MVM.artistName ?? ""
        cell.detailTextLabel?.text = MVM.trackName ?? ""
        return cell
    }
    
    
}
