//
//  PreviousRequestsVC.swift
//  Dawerha
//
//  Created by mona aleid on 13/06/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase
import FirebaseAuth

class PreviousRequestsVC: UIViewController, UITableViewDataSource {
    
    var dictionary: [String: Any] = [:]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let request = requests[indexPath.row]
        let cell = requestslistTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = request.typeWaste
        cell.detailTextLabel?.text = request.pickupDate
        
        return cell
    }
    
    @IBOutlet weak var requestslistTableView: UITableView!{
        didSet {
            requestslistTableView.dataSource = self
            
        }
    }
    var databaseRef: DatabaseReference?
    
    var requests = [UserRequest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//     get the data of the request collection from the firebasestore
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requests.removeAll()
        getDataFromDB()
    }
    
    func getDataFromDB() {
        
        if let uid = Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            
            let docRef = db.collection("UserRequest").whereField("uid", isEqualTo: uid)
            
            docRef.getDocuments(){ (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let note = document["note"] as! String
                        let pickupDate = document["pickupDate"] as! String
                        let typeWaste = document["typeWaste"] as! String
                        
                        let userRequest = UserRequest(typeWaste: typeWaste, pickupDate: pickupDate, note: note)
                        
                        self.requests.append(userRequest)
                        
                        DispatchQueue.main.async {
                            self.requestslistTableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}
