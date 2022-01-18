//
//  SortingGuideViewController.swift
//  Dawerha
//
//  Created by mona aleid on 09/05/1443 AH.
//

import UIKit

class SortingGuideViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    //using array for the table view which is contains of two lables and img and use segue and swich to connect each cell with other cells
    var arrSorts = [
        ContentsCell(title: "Plastic".localaized, image: UIImage(named: "sort5")),
        ContentsCell(title: "Paper".localaized, image: UIImage(named: "sort3")),
        ContentsCell(title: "Furniture".localaized, image: UIImage(named: "sort1")),
        ContentsCell(title: "Clothes".localaized, image: UIImage(named: "sort2")),
        ContentsCell(title: "Food".localaized, image: UIImage(named: "sort4"))]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SortingGuideCell
        cell.nameSort.text = arrSorts[indexPath.row].title
        cell.imgCellPic.image = arrSorts[indexPath.row].image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(arrSorts[indexPath.row])
        
        switch indexPath.row {
        case 0:
            imageSortSet = UIImage(named: "plasticG")
            nameSortSet = "Plastic".localaized
            desSortSet = "Plastic recycling is the reprocessing of plastic waste into new and useful products. When performed correctly, this can reduce dependence on landfill, conserve resources and protect the environment from plastic pollution and greenhouse gas emissions.".localaized
        case 1:
            imageSortSet = UIImage(named: "paperG")
            nameSortSet = "Paper".localaized
            desSortSet = "The recycling of paper is the process by which waste paper is turned into new paper products. It has a number of important benefits: It saves waste paper from occupying homes of people and producing methane as it breaks down. Because paper fibre contains carbon (originally absorbed by the tree from which it was produced)".localaized
        case 2:
            imageSortSet = UIImage(named: "fG")
            nameSortSet = "Furniture".localaized
            desSortSet = "Furniture at the end of its useful life can often be recycled, especially items made from wood and metal. Most furniture can be recycled at your local recycling centre and some local authorities may also provide a collection service.".localaized
        case 3:
            imageSortSet = UIImage(named: "clothesG")
            nameSortSet = "Clothes".localaized
            desSortSet = "It is process of recovering fiber, yarn or fabric and reprocessing the textile material into useful products. Textile waste products are gathered from different sources and are then sorted and processed depending on their condition, composition, and resale value. The end result of this processing can vary, from the production of energy and chemicals to new articles of clothing.".localaized
            
        case 4:
            imageSortSet = UIImage(named: "foodG")
            nameSortSet = "Food".localaized
            desSortSet = "Food loss and waste is a major part of the impact of agriculture on climate change (it amounts to 3.3 billion tons of CO2 emissions annually and other environmental issues. . Moreover, food waste that is not handled or reclaimed properly, i.e. through composting, can have many negative environmental consequences.".localaized
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

