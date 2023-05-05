//
//  APIHelper.swift
//  MVVM
//
//  Created by Vivek Patel on 04/05/23.
//

import UIKit

enum DataError: Error{
    case invalidRespose
    case invalidURL
    case invalidData
    case network(Error?)
}

//typealias Handler = (Result<[ProductModel], DataError>) -> Void // Typealis is used for assign data type into your data type forex = typealis Vivek = String , var name : Vivek(instead of string)
//singleton Design pattern -> in this we define a class has only single object// it is small "s" singletn we cannot make object of class outside it.

typealias Handler<T> = (Result<T, DataError>) -> Void
// Singleton Design Pattern -> this is example Of Capital "S" Singletion class
final class APIHelper{
    
    static let shared = APIHelper()
    private init() {} // for "S" capital singleton
    
    func request<T: Decodable>(
        modelType: T.Type,
        type: EndPointType,
    completion: @escaping Handler<T>
    ){
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return}
        // Background task
        URLSession.shared.dataTask(with: url){data, response , error in
           // guard let data = data else {return}
           // guard let data, error == nil else {return}  // Update in xcode 14
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidRespose))
                return
            } // it check statusCode is between 200 to 299  "No need to use for lopp for check"
            
            
            do {
                // JSONDecoder() -> it convert data into Model "ProductModel" -> Make sure ProductModel is Decodable
                let products = try JSONDecoder().decode(modelType, from: data)// we get data in array so we make it as array [productModel].self if it give dictionary then use productModel.self
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
    
/*
//    func fetchProduct(completion: @escaping (Result<[ProductModel], DataError>) -> Void)
        func fetchProduct(completion: @escaping Handler){
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidURL))
            return}
        // Background task
        URLSession.shared.dataTask(with: url){data, response , error in
           // guard let data = data else {return}
           // guard let data, error == nil else {return}  // Update in xcode 14
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidRespose))
                return
            } // it check statusCode is between 200 to 299  "No need to use for lopp for check"
            
            
            do {
                // JSONDecoder() -> it convert data into Model "ProductModel" -> Make sure ProductModel is Decodable
                let products = try JSONDecoder().decode([ProductModel].self, from: data)// we get data in array so we make it as array [productModel].self if it give dictionary then use productModel.self
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }
        }.resume()
            print("Ended")
    }
    */
}

