//
//  SecondVC.swift
//  Dawerha
//
//  Created by mona aleid on 09/05/1443 AH.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var imageSort: UIImageView!
    @IBOutlet weak var nameSort: UILabel!
    @IBOutlet weak var desSort: UILabel!
    
    var imageSortSet: UIImage?
    var nameSortSet: String?
    var desSortSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSort.image = imageSortSet
        nameSort.text = nameSortSet
        desSort.text = desSortSet
        
        print("dessort .......")
        print(desSortSet ?? "")
        
    }
}
