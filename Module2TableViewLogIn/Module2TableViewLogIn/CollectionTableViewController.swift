//
//  CollectionTableViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 24/04/23.
//

import UIKit
import SafariServices

class CollectionTableViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
               
    
    struct websiteData{
        let title : String
        let titleTextURL : URL?
        
    }
    
    var imageArray = ["download" ,"download 2","download 3","download 4","download 5","download 6","download 7"]
    
    let data : [websiteData] = [
        websiteData(title: "Apple", titleTextURL: URL(string: "https://en.wikipedia.org/wiki/Apple_Inc")),
        websiteData(title: "Samsung", titleTextURL: URL(string :"https://en.wikipedia.org/wiki/Samsung")),
        websiteData(title: "Nokia", titleTextURL: URL(string : "https://en.wikipedia.org/wiki/Nokia")),
        websiteData(title: "Takken 3", titleTextURL: URL(string : "https://en.wikipedia.org/w/index.php?search=takken+3&title=Special%3ASearch&ns0=1")),
        websiteData(title: "Realme", titleTextURL: URL(string: "https://en.wikipedia.org/wiki/Realme" )),
        websiteData(title: "Poco", titleTextURL: URL(string: "https://en.wikipedia.org/w/index.php?search=poco+smart+phone&title=Special%3ASearch&ns0=1" )),
        websiteData(title: "PUBG", titleTextURL: URL(string: "https://en.wikipedia.org/wiki/PUBG:_Battlegrounds" ))
        
    ]
    
//    @IBOutlet weak var collectionViewImages: CustomUICollectioView!
    
    
    @IBOutlet weak var collectionViewImages: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionViewImages.dataSource = self
        collectionViewImages.delegate = self 

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let webData = data[selectedIndex]
        
        let profileCell =  tableView.dequeueReusableCell(withIdentifier: "imagecell", for: indexPath) as! CollectionTableViewCell
        
        
        profileCell.imageLabel.text = webData.title
        if let url = URL(string: webData.titleTextURL?.absoluteString ?? "") {
           //let sfViewController = SFSafariViewController(url: url)
           // sfViewController.fra
            let request = URLRequest(url: url)
            profileCell.webView.load(request)
        }
     

//        profileCell.imageTextField?.text = webData.titleTextURL?.absoluteString ?? ""
        
        return profileCell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 250
    }

}

extension CollectionTableViewController :UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCollectionViewCell
                
        cell.image.image = UIImage(named: imageArray[indexPath.row])
        
        print("\(indexPath.row)")
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
            return 1
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 100, height: 100)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // get supercalss => CollectionTableViewController
        //supeclassObj.selectedIndex = indexPath.row
        //supeclassobj. tableView.reloadData
        selectedIndex = indexPath.row
        tableView.reloadData()
        print("\(indexPath.row)")
        
        
    }
}
