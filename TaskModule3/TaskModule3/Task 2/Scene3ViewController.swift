//
//  Scene3ViewController.swift
//  TaskModule3
//
//  Created by Vivek Patel on 29/04/23.
//

import UIKit

class Scene3ViewController: UIViewController  ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    

    let imageArray:[String] = ["Rectangle 20413 (2)","Rectangle 20413 (3)","Rectangle 20413 (4)","Rectangle 20413 (3)","Rectangle 20413 (3)","Rectangle 20413 (3)"]
    
    let nameArray:[String] = ["ABc","ABc","ABc","ABc","ABc","ABc"]
    let labelrray:[String] = ["ABc","ABc","ABc","ABc","ABc","ABc"]
    
    @IBOutlet weak var Scene3CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = Scene3CollectionView.dequeueReusableCell(withReuseIdentifier: "scene3Cell", for: indexPath) as! Scene3CollectionViewCell
        cell.imageScene3.image = UIImage(named: imageArray[indexPath.row])
        cell.nameScene3.text = nameArray[indexPath.row]
        cell.textScene3.text = labelrray[indexPath.row]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the size of each item here
       
        return CGSize(width: 386, height: 100)
    }
    
}
