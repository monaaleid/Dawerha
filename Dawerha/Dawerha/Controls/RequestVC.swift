//
//  RequestVC.swift
//  Dawerha
//
//  Created by mona aleid on 11/05/1443 AH.
//

import UIKit
import CoreLocation


class RequestVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var types: UIButton!
    
    @IBOutlet var outletWasteTypes: [UIButton]!
    
    @IBOutlet weak var textFieldDate: UITextField!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var AdressLabel: UILabel!
     
    @IBOutlet weak var noteLbl: UILabel!
    var locationManger: CLLocationManager!
    
    @IBOutlet weak var textNote: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  let date = Date()
  let fromatter = DateFormatter()
        fromatter.dateFormat = "dd/MM/yyyy"
        textFieldDate.text = fromatter.string(from: date)
        textFieldDate.textColor = .black
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 250)
        textFieldDate.inputView = datePicker
        
        
        types.layer.cornerRadius = types.frame.height / 2
        outletWasteTypes.forEach{ (btn) in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
            
       }
        
        locationManger = CLLocationManager()
            locationManger.delegate = self
    }
    
    @IBAction func detectLocationBtnClick(_ sender: Any) {
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            print("Location Enabled")
            locationManger.startUpdatingLocation()
        } else {
            print("Location not Enabled")
        }
    }
    private func locationManager(_manger: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        let userLocation = locations[0] as CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        latitudeLabel.text = "Latitude: \(latitude)"
        longitudeLabel.text = "Longitude: \(longitude)"
        let geocorder = CLGeocoder()
        geocorder.reverseGeocodeLocation(userLocation){ (placemarks, error) in
            if (error != nil){
                print("Error in reverseGeocodeLocation")
            }
            let placemarks = placemarks! as [CLPlacemark]
            if (placemarks.count>0){
                let placemarks = placemarks[0]
                let locality = placemarks.locality ?? ""
                let administrativeArea = placemarks.administrativeArea ?? ""
                let country = placemarks.country ?? ""
                
                self.AdressLabel.text = "address: \(locality), \(administrativeArea), \(country),"
            }
        }
        
    }
    
    
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let fromatter = DateFormatter()
        fromatter.dateFormat = "dd/MM/yyyy"
        textFieldDate.text = fromatter.string(from: sender.date)
        
    }
    
    @IBAction func btnTypes(_ sender: UIButton) {
        outletWasteTypes.forEach{ (btn) in
            UIView.animate(withDuration: 0.7){
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
       }
      }
    }
    
    @IBAction func wasteTypes(_ sender: UIButton) {
        if let btnLbl = sender.titleLabel?.text {
            print(btnLbl)
   }
  }
    
 }
