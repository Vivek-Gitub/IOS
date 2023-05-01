//
//  ProductListViewController.swift
//  TaskModule3
//
//  Created by Vivek Patel on 29/04/23.
//

import UIKit
import CoreData

struct userModel{
    let productname: String
    let productdesc: String
    let productdate: String
    let productprice: Int
}


class ProductListViewController: UIViewController {

    private var users: [ProductData] = []
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        users =  fetchdata()
        myCollectionView.reloadData()
    }

}

extension ProductListViewController :UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        let product = users[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.desclabel.text = product.productDesc
        
        var chengetoString :String = String(product.price)
        cell.priceLabel.text = chengetoString
        cell.dateLabel.text = product.expirtyDate
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the size of each item here
        let itemWidth = collectionView.frame.width / 2
        let itemHeight = itemWidth * 1
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func fetchdata() -> [ProductData]{
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var userDeta : [ProductData] = []
        
        do{
            userDeta = try context.fetch(ProductData.fetchRequest())
            print(userDeta)
        }catch let error as Error{
            print("erro====",error.localizedDescription)
        }
        
        return userDeta
    }
    
}
