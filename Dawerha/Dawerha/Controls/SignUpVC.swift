//
//  SignUpVC.swift
//  Dawerha
//
//  Created by mona aleid on 04/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SwiftUI

class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBagroundTap()
        
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        if nameTF.text?.isEmpty == true {
            print("No Text in Name Field")
            return
        }
        if newEmail.text?.isEmpty == true {
            print("No Text in Email Field")
            return
        }
        if phoneNumber.text?.isEmpty == true {
            print("No Text in Phone Number Field")
            return
        }
        if newPassword.text?.isEmpty == true {
            print("No Text in Password Field")
            return
        }
        
        signUp()
        
        
    }
    
    
    @IBAction func signinBtn(_ sender: Any) {
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: newEmail.text!, password: newPassword.text!) { (authResult, error) in
            guard let user = authResult? .user, error == nil else {
                print("Error\(String(describing: error?.localizedDescription))")
                return
            }
            
            UserApi.addUser(name: self.nameTF.text ?? "", uid: authResult?.user.uid ?? "", phone: self.phoneNumber.text ?? "", email: self.newEmail.text ?? "", completion: { b in
                self.performSegue(withIdentifier: "mainHome", sender: nil)
            })
        }
    }
    
    
    private func setupBagroundTap(){
        
        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(false)
    }
}

