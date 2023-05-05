//
//  ProductMiewModel.swift
//  MVVM
//
//  Created by Vivek Patel on 04/05/23.
//

import Foundation

final class ProductViewModel{
    
    var products :[ProductModel] = []
    var eventHandler : ((_ event: Event) -> Void)? // Data Binding closure
    
    func fetchProduct(){
        self.eventHandler?(.loading)
        APIHelper.shared.request(
            modelType: [ProductModel].self,
            type: EndPointItems.products
        ) {response in
            self.eventHandler?(.stopLoading)
            switch response{
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoading)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    /*
    func fetchProduct() {
        self.eventHandler?(.loading) // Y   aha pe loading start ho gai hai
        APIHelper.shared.fetchProduct { response in // yaha taak response aa jayega
            self.eventHandler?(.stopLoading)
            switch response{
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoading)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    */
}

extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoading
        case error(Error?)
    }
}
