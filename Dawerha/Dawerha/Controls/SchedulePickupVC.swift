//
//  SchedulePickupVC.swift
//  Dawerha
//
//  Created by mona aleid on 10/05/1443 AH.
//

import UIKit

class SchedulePickupVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var btnTitleDays: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var arrSchedulePickup = [UIImage(named: "days1")!, UIImage(named: "days2")!, UIImage(named: "days3")!, UIImage(named: "days4")!, UIImage(named: "days5")!, UIImage(named: "days6")!, UIImage(named: "days7")!, UIImage(named: "days8")!]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
//     collection to show all the detailes of the Schedule to Pickup the wastw
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSchedulePickup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "daysCell", for: indexPath) as! ScheduleCollectionViewCell
        cell.cellImgScedule.image = arrSchedulePickup[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 2.3, height: self.view.frame.width / 2.3)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
