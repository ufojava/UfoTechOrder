//
//  UpdateOrdersForm.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 11/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData



//Orders Update form
class UpdateOrdersForm: UIViewController {
    
    //Orders form Outlets
    @IBOutlet weak var ordersImageOutletView: UIImageView!
    @IBOutlet weak var searcInvoiceOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var infoSearchOutletLabel: UILabel!
    @IBOutlet weak var itemCodeOutletText: UITextField!
    @IBOutlet weak var itemOutletText: UITextField!
    @IBOutlet weak var itemDescriptionOutletText: UITextField!
    @IBOutlet weak var quantityOutletText: UITextField!
    @IBOutlet weak var unitCostOutletText: UITextField!
    @IBOutlet weak var orderCostOutletText: UITextField!
    @IBOutlet weak var updateOutletButton: UIButton!
    @IBOutlet weak var infoUpdateOutletLabel: UILabel!
    @IBOutlet weak var refreshOrderCalcOutletButton: UIButton!
    

    //Calcluator variables
    var globalUnitCost = Double()
    var globalQty = Double()
    var globalOrdCostCalc = Double()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Enter Custom functions
        formatVC()
        
    }
    
    
    //Format ViewController
    func formatVC() {
        
        //Set ViewController background
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Set image logo
        ordersImageOutletView.image = UIImage(named: "ordersUpdate.jpg")
        ordersImageOutletView.layer.shadowOpacity = 1
        ordersImageOutletView.layer.shadowRadius = 5
        ordersImageOutletView.layer.cornerRadius = 15
        ordersImageOutletView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        //Set Text fields
        searcInvoiceOutletText.layer.shadowOpacity = 1
        searcInvoiceOutletText.layer.shadowRadius = 5
        searcInvoiceOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        searcInvoiceOutletText.clearButtonMode = .always
        searcInvoiceOutletText.autocapitalizationType = .allCharacters
        
        itemCodeOutletText.layer.shadowOpacity = 1
        itemCodeOutletText.layer.shadowRadius = 5
        itemCodeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemCodeOutletText.clearButtonMode = .always
        itemCodeOutletText.autocapitalizationType = .allCharacters
        
        itemOutletText.layer.shadowOpacity = 1
        itemOutletText.layer.shadowRadius = 5
        itemOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemOutletText.clearButtonMode = .always
        
        itemDescriptionOutletText.layer.shadowOpacity = 1
        itemDescriptionOutletText.layer.shadowRadius = 5
        itemDescriptionOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemDescriptionOutletText.clearButtonMode = .always
        
        quantityOutletText.layer.shadowOpacity = 1
        quantityOutletText.layer.shadowRadius = 5
        quantityOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        quantityOutletText.clearButtonMode = .always
        
        unitCostOutletText.layer.shadowOpacity = 1
        unitCostOutletText.layer.shadowRadius = 5
        unitCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        unitCostOutletText.clearButtonMode = .always
        
        orderCostOutletText.layer.shadowOpacity = 1
        orderCostOutletText.layer.shadowRadius = 5
        orderCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        orderCostOutletText.clearButtonMode = .always
        
        //Format button
        searchOutletButton.setTitleColor(.blue, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 10
        searchOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        updateOutletButton.setTitleColor(.blue, for: .normal)
        updateOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateOutletButton.layer.shadowOpacity = 1
        updateOutletButton.layer.shadowRadius = 5
        updateOutletButton.layer.cornerRadius = 10
        updateOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        refreshOrderCalcOutletButton.setTitleColor(.blue, for: .normal)
        refreshOrderCalcOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        refreshOrderCalcOutletButton.layer.shadowOpacity = 1
        refreshOrderCalcOutletButton.layer.shadowRadius = 5
        refreshOrderCalcOutletButton.layer.cornerRadius = 10
        refreshOrderCalcOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        
        
    }
    
    //Search for Order
    
    @IBAction func searchActionButton(_ sender: UIButton) {
        
        //Call getOrders
        getOrder(inInvoice: searcInvoiceOutletText.text!)
    }
    
    //Update Order Cost
    @IBAction func refreshOrderCostButton(_ sender: UIButton) {
        orderCalc()
    }
    
    
    

//Back button to take user to the Produce /Orders  Update and Delete Menu with Identifier (updateDeleteMenu) and VC (prodOrdersUpdate)
    
    @IBAction func backToUpdateOrdersMenu(_ sender: UIBarButtonItem) {
        
        //Set main StoryBoard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Destination VC
        let ordersProdMenu = mainStoryboard.instantiateViewController(withIdentifier: "updateDeleteMenu") as! prodOrdersUpdate
        
        //Call function
        self.present(ordersProdMenu,animated: true,completion: nil)
        
    }
    
    //Function to retreive data from Orders CoreData
    func getOrder(inInvoice: String) {
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Order Entity
        let ordersEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Orders")
        
        //Predicate Invoice Number
        ordersEntity.predicate = NSPredicate(format: "invoiceNo == %@", inInvoice)
        
        //set fault result
        ordersEntity.returnsObjectsAsFaults = false
        
        //Get Order from CoreData Entity Orders
        
        do {
           
            let results = try context.fetch(ordersEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        guard let resInvSearch = result.value(forKey: "invoiceNo") else {
                            
                            print("Did not find record")
                            return
                        }
                        
                        print("The invoice number is: \(resInvSearch)")
                        
                        //Assign Item Code
                        guard let resItemCode = result.value(forKey: "itemCode") as? String else {
                            print("Item Code has nil value")
                            return
                        }
                        
                        //Assign Itemcode
                        print("The Item Code is: \(resItemCode)")
                        itemCodeOutletText.text = resItemCode
                        
                        
                        
                        //Assign Item
                        guard let resItem = result.value(forKey: "item") as? String else {
                            print("Item has nil value")
                            return
                        }
                        
                        print("The Item is: \(resItem)")
                        itemOutletText.text = resItem
                        
                        //Assign Description
                        guard let resDesc = result.value(forKey: "itemDescription") as? String else {
                            print("Description has nil value")
                            return
                        }
                        
                        print("The Description is: \(resDesc)")
                        itemDescriptionOutletText.text = resDesc
                        
                        //Assign Qunatity
                        guard let resQty = result.value(forKey: "quantity") as? String else {
                            print("Quantity has nil value")
                            return
                        }
                        
                        print("The quantity is: \(resQty)")
                        quantityOutletText.text = resQty
                        
                        //Assing Unit Cost
                        guard let resUnitCost = result.value(forKey: "unitCost") as? String else {
                            print("Unit Cost has nil value")
                            return
                        }
                        
                        print("The Unit Cost is: \(resUnitCost)")
                        unitCostOutletText.text = resUnitCost
                        
                        guard let resOrdCost = result.value(forKey: "orderCost") else {
                            print("Order Cost has nil value")
                            return
                        }
                        
                        print("The Order Cost is \(resOrdCost)")
                        
                        //Calculate Order Cost
                         let resUnitCostConvert = (resUnitCost as NSString).doubleValue
                         let resQtyConvert = (resQty as NSString).doubleValue
                        
                         let ordCostCalc = resUnitCostConvert * resQtyConvert
                        
                        //Assigning Order Cost
                        print("The Order Cost is: \(ordCostCalc)")
                        orderCostOutletText.text = String(ordCostCalc)
                        
                    }
                    
        }
        
        
        
        } catch {
            print("Unable to find record")
        }
    

}
    
    //Function to update order cost
    func orderCalc() {
        
        if (unitCostOutletText.text != " " && quantityOutletText.text != " ") {
            
            globalOrdCostCalc = (unitCostOutletText.text! as NSString).doubleValue * (quantityOutletText.text! as NSString).doubleValue
            orderCostOutletText.text = String(globalOrdCostCalc)
            
        } else {
            
            print("Found nil value in one of the calc fields")
        }
        
        
    }



}
