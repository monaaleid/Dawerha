//
//  User.swift
//  Dawerha
//
//  Created by mona aleid on 05/05/1443 AH.
//

import Foundation
import UIKit

class User {
    
    var phone: String?
    var email: String?

}
extension User {
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.phone = dict["phone"] as? String
        user.email = dict["email"] as? String
       
        return user
    }
    static func CreateUser(phone:String,name:String,email:String) -> [String: Any] {
       
        let newUser = ["phone":phone,
                       "email" :email
                    ] as [String : Any]
        
        return newUser
    }
}

