//
//  User.swift
//  Dawerha
//
//  Created by mona aleid on 05/05/1443 AH.

import Foundation
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import CoreLocation

class User {
    
    var name: String?
    var phone: String?
    var email: String?
    var address: String?
    var longitude: Double?
    var latitude: Double?
    
}

extension User {
    
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
       
        
        user.phone = dict["phone"] as? String
        user.email = dict["email"] as? String
        user.name = dict["name"] as? String
        user.address = dict["address"] as? String
        
        return user
    }
   
      static  func CreateUser(phone:String,name:String,email:String) -> [String: Any] {
       
        let newUser = ["phone":phone,
                       "email":email,                     
                       "name" :name] as [String : Any]
        return newUser
    }
}
