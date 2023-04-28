//
//  Parser.swift
//  APi prcatice
//
//  Created by Vivek Patel on 26/04/23.
//

import Foundation

struct Parser{
    func paerse(){
        let api = URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")
        
        URLSession.shared.dataTask(with: api!){
            data, response ,error in
            if error != nil{
                print("This is error")
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(Welcome.self, from: data!)
                print(result)
            } catch{
                
            }
            
        }.resume()
    }
}
