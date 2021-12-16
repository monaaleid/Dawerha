//
//  SortingGuideCell.swift
//  Dawerha
//
//  Created by mona aleid on 09/05/1443 AH.
//

import UIKit

class SortingGuideCell: UITableViewCell {

    @IBOutlet weak var imgCellPic: UIImageView!
    
        @IBOutlet weak var nameSort: UILabel!
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
