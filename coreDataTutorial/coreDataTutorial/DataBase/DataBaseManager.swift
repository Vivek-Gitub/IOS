//
//  DataBaseManager.swift
//  coreDataTutorial
//
//  Created by Vivek Patel on 28/04/23.
//

import UIKit



class DataBaseManager{
    
    func addUser(_ user: UserModel){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let userEntity = UsersDetails(context: context)
        
        userEntity.name = user.name
        userEntity.email = user.email
        userEntity.password = user.password
        
        
        do{
            try  context.save()
            print("data saved")
        }catch let error as NSError{
            print("print to save===" ,error.localizedDescription)
        }
    }
}
