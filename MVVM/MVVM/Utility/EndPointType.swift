//
//  EndPointType.swift
//  MVVM
//
//  Created by Vivek Patel on 05/05/23.
//

import Foundation

enum HTTPMethods : String{
    case get = "GET"
    case post = "POST"
}

protocol EndPointType{
    var path: String {get}
    var baseURL: String {get}
    var url: URL? {get}
    var method: HTTPMethods {get}
}

enum EndPointItems {
    case products  // module
}


//https://fakestoreapi.com/products
extension EndPointItems: EndPointType{
    var path: String {
        switch self{
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self{
        case .products:
            return .get
        }
    }
    
    
}
