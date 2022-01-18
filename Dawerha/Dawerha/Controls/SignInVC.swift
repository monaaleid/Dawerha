//
//  SignInVC.swift
//  Dawerha
//
//  Created by mona aleid on 04/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignInVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        validateFileds()
    }
    @IBAction func btnCreateNewAcc(_ sender: Any) {
        
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    func validateFileds(){
        if email.text?.isEmpty == true{
            print("No Email Text")
            return
        }
        if password.text?.isEmpty == true{
            print("No Password Text")
            return
        }
        login()
        
        
    }
    func login(){
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self]authResult, err in
            guard let strongSelf = self else {return}
            if err != nil {
                let alert = UIAlertController(title: "Error".localaized, message: "Sorry, Couldn't find your Account".localaized , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK".localaized , style: .default , handler: nil))
                self?.present(alert, animated : true)
            }else {
                self?.performSegue(withIdentifier: "toMainHome", sender: nil)
                
                //print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid ?? "")
            performSegue(withIdentifier: "toMainHome", sender: nil)
            
        }
    }
}
