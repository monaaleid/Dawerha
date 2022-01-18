//
//  RequestVC.swift
//  Dawerha
//
//  Created by mona aleid on 11/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Firebase


class RequestVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerViewTypes: UIPickerView!
    @IBOutlet weak var types: UIButton!
    @IBOutlet weak var typeWaste: UITextField!
    @IBOutlet weak var pickupDate: UITextField!
    @IBOutlet weak var note: UITextField!
    
    let database = Firestore.firestore()
    let userRequest : UserRequest? = nil
    var arrWasteTypes = ["Food".localaized, "Plastics".localaized, "Paper and Books".localaized, "Clothes".localaized]
    
    
    var documentID : String?
    var dictionary: [String: Any] {
        return ["typeWaste": typeWaste.text!, "pickupDate": pickupDate.text!, "note": note.text!, "uid": Auth.auth().currentUser?.uid ?? ""]
    }
    
    //         using the picker Date to determine the waste type
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrWasteTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrWasteTypes[row]
    }
    func pickerView(_pickerView:UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: arrWasteTypes[row], attributes:[NSAttributedString.Key.foregroundColor: UIColor.systemBrown])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        typeWaste.text = arrWasteTypes[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewTypes.delegate = self
        pickerViewTypes.dataSource = self
        typeWaste.text = arrWasteTypes[pickerViewTypes.selectedRow(inComponent: 0)]
        
//         using the picker Date to determine the date waste pickup time
        let datePicker = Date()
        let fromatter = DateFormatter()
        fromatter.dateFormat = "dd/MM/yyyy"
        pickupDate.text = fromatter.string(from: datePicker)
        pickupDate.textColor = .black
        
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        datePickerView.frame.size = CGSize(width: 0, height: 250)
        pickupDate.inputView = datePickerView
        
    }
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {   let fromatter = DateFormatter()
        fromatter.dateFormat = "dd/MM/yyyy"
        pickupDate.text = fromatter.string(from: sender.date)
    }
    
    func saveData() {
        //get userID
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        
        // create dictionary rep data to save
        
        Firestore.firestore().collection("UserRequest").addDocument(data: dictionary)
        
    }
//       fnc for dissmising the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func confirmRequest(_ sender: Any) {
        let alert = UIAlertController(title: "Do You Want To Confirm Your Request?".localaized, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes".localaized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        saveData()
    }
}

