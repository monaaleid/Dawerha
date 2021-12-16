//
//  SortingGuideViewController.swift
//  Dawerha
//
//  Created by mona aleid on 09/05/1443 AH.
//

import UIKit

class SortingGuideViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    //using array for the table view which is contains of two lables and img and use segue and swich to connect each cell with other cells
    var arrSorts = ["Plastic", "Nylon", "Paper" , "Cans"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var imageSortSet: UIImage?
    var nameSortSet: String?
    var desSortSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrSorts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Plastic", for: indexPath) as! SortingGuideCell
            cell.nameSort.text = arrSorts[indexPath.row]
            return cell
            
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            print(arrSorts[indexPath.row])
            
            switch indexPath.row {
            case 0:
                imageSortSet = UIImage(named: "plasticPic")
                nameSortSet = "Plastic"
                desSortSet = "Plastic recycling refers to the process of recovering waste or scrap plastic and reprocessing the materials into functional and useful products. This activity is known as the plastic recycling pr."
                
                imageSortSet = UIImage(named: "nylonPic")
                nameSortSet = "Nylon"
                desSortSet = "Nylon is aas the first fabric made entirely in a laboratory and its invention represents the dawn of the age of synthetics."
            case 2:
                imageSortSet = UIImage(named: "paperPic")
                nameSortSet = "Paper"
                desSortSet = "process by which wathe atmosphere.he paper is then washed to remove any film, glue, ink and other contaminants using soapy water. "
            case 3:
                imageSortSet = UIImage(named: "cansPic")
                nameSortSet = "Cans"
                desSortSet = "Recycling aluminium uses only around 5% of the energy and emissions needed to make it from the raw material bauxite. The metal can be recycled without loss of properties, so getting the aluminium recycling habit is one of the best things we can do for the environment. Steel can also be recyclmption of energy and the emission of gasses like carbon dioxide into the atmosphere."
            default:
                print(" ")
            }
            
            performSegue(withIdentifier: "details", sender: nil)
    
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! SecondVC
        vc.nameSortSet = nameSortSet
        vc.imageSortSet = imageSortSet
        vc.desSortSet = desSortSet
       
    }
 
}

