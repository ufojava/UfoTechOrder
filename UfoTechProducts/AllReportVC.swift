//
//  AllReportVC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 19/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

class AllReportVC: UIViewController {
    
    //TableView outlet
    @IBOutlet weak var reportOutletTableView: UITableView!
    @IBOutlet weak var titleOutletLabel: UILabel!
    
    
    
    
    
    //Array for CoreData
    var itemCodeArray: [String] = []
    var itemArray: [String] = []
    var descriptionArray: [String] = []
    var unitCostArray: [String] = []
    var quantityArray: [String] = []
    var totalCostArray: [Double] = []
    
    //Variable to hold item for deletion
    var itemForDeletion = String()
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function
        formatVC() //Format Title Lable
        getAllData() //Reteive data from CoreData
        ConDeleData() //Connect Delegate and Datasource
    }
    
    
    //Funcion to retreive data from CoreData
    func getAllData() {
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Declare entiry
        let produceEntiry = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        
        //Set fault result
        produceEntiry.returnsObjectsAsFaults = false
        
        //Get records
        
        do {
            
            let results = try context.fetch(produceEntiry)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    //Assign value to fields
                    if let itemCode = result.value(forKey: "itemCode") as? String, let item = result.value(forKey: "item")as? String, let desription = result.value(forKey: "itemDescription") as? String, let unitCost = result.value(forKey: "unitCost") as? String, let quantity = result.value(forKey: "quantity") as? String, let totalCost = result.value(forKey: "totalCost") {
                        
                        //Assign to Array
                        itemCodeArray.append(itemCode)
                        itemArray.append(item)
                        descriptionArray.append(desription)
                        unitCostArray.append(unitCost)
                        quantityArray.append(quantity)
                        totalCostArray.append(totalCost as! Double)
                    }
                    
                    
                    
                }
                
            }
            
        } catch {
            print("Unable to retrive records")
        }
        
        
        
    }
    
    //Function to connect Delegate and Datasource
    func ConDeleData() {
        
        reportOutletTableView.delegate = self
        reportOutletTableView.dataSource = self
    }
    
    //Format ViewController
    func formatVC() {
        titleOutletLabel.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        titleOutletLabel.textColor = UIColor.white
        titleOutletLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleOutletLabel.layer.shadowOpacity = 1
        titleOutletLabel.layer.shadowRadius = 6
        titleOutletLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
    }
    
    //Item Action to go back to Reports Menu Identifier (reportMenuVC)
    @IBAction func backRptMenuItemAction(_ sender: UIBarButtonItem) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let rptMainMenu = storyBoard.instantiateViewController(withIdentifier: "reportMenuVC") as! reportsMainMenuVC
        
        //Call Reports Main Menu
        self.present(rptMainMenu, animated: true, completion: nil)
        
    }
    
    



}

//Extension to display CoreData in TableView
extension AllReportVC: UITableViewDelegate, UITableViewDataSource {

    //Number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCodeArray.count
    }
    
    //Cell content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reportOutletTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReportTableViewCell
        
        
        //Create lable description
        
    
        
        //Assinging values to cells
        
        cell.itemCodeOutletCell.text = "Item Code: \(itemCodeArray[indexPath.row])"
        cell.itemOutletCell.text = "Item: \(itemArray[indexPath.row])"
        cell.descriptionOutletCell.text = "Description: \(descriptionArray[indexPath.row])"
        cell.quantityOutletCell.text = "Qty: \(quantityArray[indexPath.row])"
        cell.unitCostOutletCell.text = "Unit Cost: \(unitCostArray[indexPath.row])"
        cell.totalCostOutletCell.text = "Total Cost: \(String(totalCostArray[indexPath.row]))"
        
        return cell
        
    }
    
 
 
 
}
