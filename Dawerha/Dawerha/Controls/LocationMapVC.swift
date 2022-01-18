//
//  LocationMapVC.swift
//  Dawerha
//
//  Created by mona aleid on 12/05/1443 AH.
//

import UIKit
import MapKit


class LocationMapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLoc = CLLocation(latitude: 27.48201, longitude: 41.69196)
        
        setStartingLocation(location: initialLoc, distance: 25000)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 27.523225, longitude: 41.654222)
        annotation1.title = "Used Clothes Bin".localaized
        annotation1.subtitle = "Entag Bin".localaized
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude:27.544293, longitude: 41.702290)
        annotation2.title = "Furniture Recycle Bin".localaized
        annotation2.subtitle = "Dalil Bin".localaized
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude:27.524931, longitude: 41.658972)
        annotation3.title = "Paper Recycle Bin".localaized
        annotation3.subtitle = "Tadweer Bin".localaized
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude:27.560361, longitude: 41.727711)
        annotation4.title = "Plastics Recycle Bin".localaized
        annotation4.subtitle = "SARPC Bin".localaized
        
        mapView.addAnnotation(annotation1)
        mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation3)
        mapView.addAnnotation(annotation4)
        
    }
    
    func setStartingLocation(location: CLLocation, distance: CLLocationDistance){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 250000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
  }

