//
//  ScheduleCollectionViewCell.swift
//  Dawerha
//
//  Created by mona aleid on 10/05/1443 AH.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImgScedule: UIImageView!
    
    func setupCell(photo: UIImage){
        cellImgScedule.image = photo 
    }
}
