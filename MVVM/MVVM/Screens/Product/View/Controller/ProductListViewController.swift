//
//  ProductListViewController.swift
//  MVVM
//
//  Created by Vivek Patel on 04/05/23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ProductViewModel()
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configuration()
        
    }
    
    
    
}

extension ProductListViewController{
    func configuration(){
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        viewModel.fetchProduct()
    }
    // Data binding event observe karega - communication
    func observeEvent(){
        viewModel.eventHandler = {[weak self] event in
            guard let self else{return}
            switch event{
            case .loading:
                print("product loading")
            case .stopLoading:
                print("stop loading")
            case .dataLoading:
                print("data loaded")
                DispatchQueue.main.async {
                   // UI main work well
                    self.productTableView.reloadData()
                }
                print(self.viewModel.products)
                
            case .error(let error):
                print(error)
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {return UITableViewCell()}
        
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    
}
