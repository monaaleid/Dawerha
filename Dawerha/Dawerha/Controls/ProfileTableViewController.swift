//
//  ProfileVCTableViewController.swift
//  Dawerha
//
//  Created by mona aleid on 03/06/1443 AH.
//

import UIKit
import CoreLocation
import FirebaseFirestore
import FirebaseAuth
import Firebase

class ProfileTableViewController: UITableViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var profileBGView: UIView!
    @IBOutlet weak var emailProfile: UITextField!
    @IBOutlet weak var mobileProfile: UITextField!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    @IBOutlet weak var darkLightLbl: UILabel!
    @IBOutlet weak var switchLanguageLbl: UIView!
    
    var locationManger : CLLocationManager!
    var handler : AuthStateDidChangeListenerHandle?
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger = CLLocationManager()
        locationManger.delegate = self
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            self.nameProfile.text = user.name
            self.emailProfile.text = user.email
            self.mobileProfile.text = user.phone
            self.addressLabel.text = user.address
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    
    //     for change the profile picture localy
    @IBAction func changePhotoBtn(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        imgProfile.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    //     to give the current location of the user
    @IBAction func detectLocationBtnClick(_ sender: Any) {
        if   Auth.auth().currentUser?.uid != nil {
            
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestAlwaysAuthorization()
            if CLLocationManager.locationServicesEnabled(){
                print("Location Enabled")
                locationManger.startUpdatingLocation()
            } else {
                print("Location not Enabled")
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
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
                
                self.addressLabel.text = "address: \(locality), \(administrativeArea), \(country),"
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // changeing to the dark mode by the app delegate
    @IBAction func darkMode(_ sender: Any) {
        if #available(iOS 15.0,*){
            let appDelegate = UIApplication.shared.windows.first
            if (sender as AnyObject).isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
    }
    
    //     changeing the language by sending the user to the phone settings
    @IBAction func language(_ sender: Any) {
        let alert = UIAlertController(title: "You can change your language by going to your device settings.".localaized, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok".localaized, style: .default, handler: nil))
        let settings = UIAlertAction(title: "See Settings".localaized, style: .default, handler: { (action) -> Void in
            UIApplication.shared.open(URL(string: "App-Prefs:root=GENERAL")!, options: [:], completionHandler: nil)
        })
        alert.addAction(settings)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        handler = Auth.auth().addStateDidChangeListener({ (Auth, user) in
            
            if (user == nil )
            {
                print("Signed Out")
            }else{
                print("Signed in")
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        Auth.auth().removeStateDidChangeListener(handler!)
        loadUserDetails()
    }
    
    func loadUserDetails() {
        guard let userID = Auth.auth().currentUser?.uid else{
            print("Please Login First")
            return
        }
        database.collection("Users").document(userID)
        
        let refDoc = database.collection("Users").document(userID)
        refDoc.getDocument{ (document, err) in
            if (document?.data() != nil){
            } else
            {
                print("User info loaded")
            }
        }
    }
    func saveUserDetails(){
    }
    

    @IBAction func signOutBtn(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            
        }
        let alert = UIAlertController(title: "Do You Want To Sign Out?".localaized, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes".localaized, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
}


