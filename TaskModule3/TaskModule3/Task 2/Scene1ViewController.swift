//
//  Scene1ViewController.swift
//  TaskModule3
//
//  Created by Vivek Patel on 29/04/23.
//

import UIKit

class Scene1ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var scene1CollectionView: UICollectionView!
    
    let ImageArray :[String] = ["Group 482714","Group 482717","Group 1000007513","Group 1000007514"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scene1CollectionView.dequeueReusableCell(withReuseIdentifier: "scene1Cell", for: indexPath) as! Scene1CollectionViewCell
         
        
        cell.imageScene1.image = UIImage(named: ImageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the size of each item here
       
        return CGSize(width: 335, height: 219)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signView = mainStoryboard.instantiateViewController(withIdentifier: "Scene2ViewController") as! Scene2ViewController
        self.present(signView, animated: true)
        
        print(indexPath.row)
    }
}
