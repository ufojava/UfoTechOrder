//
//  AllOrdersReport_VC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 03/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//All Orders Report View Controller - This is a single report ********
class AllOrdersReport_VC: UIViewController {
    
    //Orders Report Outlets
    @IBOutlet weak var ordersImageOutletView: UIImageView!
    @IBOutlet weak var invoiceSrchOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var itemOutletLabel: UILabel!
    @IBOutlet weak var descriptionOutletLabel: UILabel!
    @IBOutlet weak var unitCostOutletLabel: UILabel!
    @IBOutlet weak var quantityOutletLabel: UILabel!
    @IBOutlet weak var orderCostOutletLabel: UILabel!
    @IBOutlet weak var deleteOutletButton: UIButton!
    
    //Search Info Outlet
    @IBOutlet weak var searchInfoOutletLabel: UILabel!
    @IBOutlet weak var deleteInfoOutletLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function starts here
        formatVC()
    }
    
    //Search Action Button
    @IBAction func orderSrchButton(_ sender: UIButton) {
        
        if invoiceSrchOutletText.text != " " {
            getOrder(invoiceSrch: invoiceSrchOutletText.text!)
            
        } else {
            print("Nil value found")
        }
        
    }
    
    //Delete order
    @IBAction func deleteActionButton(_ sender: UIButton) {
        
        if invoiceSrchOutletText.text != " " {
        deleteOrder(invoiceSrch: invoiceSrchOutletText.text!)
        
        } else {
            print("Nil value in field")
        }
        
    }
    
    
    
    
    //Format the Orders View Controller
    func formatVC() {
        
        //Set the background
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Set Image
        ordersImageOutletView.image = UIImage(named: "ordersRpt.jpg")
        ordersImageOutletView.layer.shadowOpacity = 1
        ordersImageOutletView.layer.shadowRadius = 5
        ordersImageOutletView.layer.cornerRadius = 15
        ordersImageOutletView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        //Set Text Field
        invoiceSrchOutletText.layer.shadowOpacity = 1
        invoiceSrchOutletText.layer.shadowRadius = 5
        invoiceSrchOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        invoiceSrchOutletText.autocapitalizationType = .allCharacters
        invoiceSrchOutletText.clearButtonMode = .always
        
        //Set labels test colour
        itemOutletLabel.textColor = UIColor.blue
        descriptionOutletLabel.textColor = UIColor.blue
        unitCostOutletLabel.textColor = UIColor.blue
        quantityOutletLabel.textColor = UIColor.blue
        orderCostOutletLabel.textColor = UIColor.blue
        
        //Set Button
        searchOutletButton.setTitleColor(.blue, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 10
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        deleteOutletButton.setTitleColor(.blue, for: .normal)
        deleteOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        deleteOutletButton.layer.shadowOpacity = 1
        deleteOutletButton.layer.shadowRadius = 5
        deleteOutletButton.layer.cornerRadius = 10
        deleteOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        
        
        
        
    }
    
    

    
    //Navigate to the reports menu - Identifier (reportMenuVC)
    @IBAction func reportsMenuActionItem(_ sender: UIButton) {
        
        //Main Storyboard
        let allOrdersStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Report Menu Variable
        let rptMainMenu = allOrdersStoryBoard.instantiateViewController(withIdentifier: "reportMenuVC") as! reportsMainMenuVC
        
        //Call Reports Main Menu
        self.present(rptMainMenu, animated: true, completion: nil)
        
        
    }
    
    //Retreive orders
    
    func getOrder(invoiceSrch: String) {
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        //Set Entity
        let ordersEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Orders")
        
        ordersEntity.predicate = NSPredicate(format: "invoiceNo == %@", invoiceSrch)
        
        //Stop fault result
        ordersEntity.returnsObjectsAsFaults = false
        
        //Search Database
        do {
            let results = try context.fetch(ordersEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let resInvoice = result.value(forKey: "invoiceNo") as? Int {
                            
                            searchInfoOutletLabel.textColor = UIColor.brown
                            searchInfoOutletLabel.text = "Invoice: \(resInvoice) found"
                            
                            //clear information screen
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0 ) {
                                self.searchInfoOutletLabel.text = ""
                            }
                            
                            //Assign values to labels
                            let resItem = result.value(forKey: "item") as? String
                            itemOutletLabel.text = "Item: \(resItem!)"
                            
                            let resDescript = result.value(forKey: "itemDescription") as? String
                            descriptionOutletLabel.text = "Desc: \(resDescript!)"
                            
                            let resUCost = result.value(forKey: "unitCost") as? String
                            unitCostOutletLabel.text = "Unit Cost: \(resUCost!)"
                            
                            let resQty = result.value(forKey: "quantity") as? String
                            quantityOutletLabel.text = "Qty: \(resQty!)"
                            
                            let resOrdCost = result.value(forKey: "orderCost") as? Double
                            orderCostOutletLabel.text = "Order Cost: \(resOrdCost!)"
                        
                        }
                    }
                } else {
                    searchInfoOutletLabel.textColor = UIColor.red
                    searchInfoOutletLabel.text = "No Record Found!!!"
                    
                    //Clear Info Screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.searchInfoOutletLabel.text = ""
                    }
            }
        } catch {
            print("Unable to retreive record")
        }
    
    }
    
    func deleteOrder(invoiceSrch: String) {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let ordersEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Orders")
        
        ordersEntity.predicate = NSPredicate(format: "invoiceNo == %@", invoiceSrch)
        
        //Stop fault result
        ordersEntity.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(ordersEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let resInvoice = result.value(forKey: "invoiceNo") {
                            print(resInvoice)
                    
                            //Delete the record
                            context.delete(result)
                            
                            invoiceSrchOutletText.text = " "
                            itemOutletLabel.text = ""
                            descriptionOutletLabel.text = ""
                            unitCostOutletLabel.text = ""
                            quantityOutletLabel.text = ""
                            orderCostOutletLabel.text = ""
                            
                            deleteInfoOutletLabel.textColor = UIColor.red
                            deleteInfoOutletLabel.text = "Order Record Deleted !!!!"
                            
                            //Clear the info label
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                self.deleteInfoOutletLabel.text = ""
                            }
                        }
                        }
                    }
        } catch {
            print("Unable to find record")
            
        }
        
        do {
            
            try context.save()
            
            deleteInfoOutletLabel.textColor = UIColor.red
            deleteInfoOutletLabel.text = "Order Record Deleted !!!!"
            
            //Clear the info label
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.deleteInfoOutletLabel.text = ""
            }
        } catch {
            print("unable to delete")
        }
        
    }
    
    
    
    
}
