//
//  OrderForm_VC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 29/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


//New Order input View Controller
class OrderForm_VC: UIViewController {
    
    var prodStockUpdate = "0.0"
    var globalStockUpdate = "0.0"
    var globalItemCode = String()
    var globalOrderCost = Double()
    
    //Order form Outlets
    @IBOutlet weak var imageOutletImageView: UIImageView!
    @IBOutlet weak var invoiceNumberOutletText: UITextField!
    @IBOutlet weak var itemCodeOutletText: UITextField!
    @IBOutlet weak var stockLookupOutletButton: UIButton!
    @IBOutlet weak var firstnameOutletText: UITextField!
    @IBOutlet weak var lastnameOutletText: UITextField!
    @IBOutlet weak var itemOutletText: UITextField!
    @IBOutlet weak var descriptionOutletText: UITextField!
    @IBOutlet weak var unitCostOutletText: UITextField!
    @IBOutlet weak var quantityOutletText: UITextField!
    @IBOutlet weak var orderCostOutletLabel: UILabel!
    @IBOutlet weak var saveOutletButton: UIButton!
    @IBOutlet weak var lookupOutletInfoLabel: UILabel!
    @IBOutlet weak var infoStockQtyLabel: UILabel!
    @IBOutlet weak var updateCostOutletButton: UIButton!
    @IBOutlet weak var infoSavedOutletLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function call
        formatVC()
        autoInvoiceNumber() //Test
        
    }
    
    //Action Lookup Button
    @IBAction func stockLookupButton(_ sender: UIButton) {
        
        //Call Lookup Button
        newOrders(inLookup: itemCodeOutletText.text!)
        
    }
    
    //Save Action Button - New Order
    @IBAction func saveActionButton(_ sender: UIButton) {
    saveNewOrder()
    updateProdStock()
    
    }
    
    
    //Action Cost Update Button
    @IBAction func updateCostActionButton(_ sender: UIButton) {
        
        //Calculate order
        let convertUnitCost = Double(unitCostOutletText.text!)
        let convertQty = Double(quantityOutletText.text!)
        
        let ordCost = calcOrder(inUnitCost: convertUnitCost!, inQty: convertQty!)
        
        print("Total Cost: \(ordCost)")
        
        orderCostOutletLabel.text = "Total Cost: £\(String(ordCost))"
        
        //Calculate the stock update
        
        
        let ordQty = (quantityOutletText.text! as NSString).doubleValue
        
        let stockUpdate = (prodStockUpdate as NSString).doubleValue - ordQty
        
        infoStockQtyLabel.text = "Qty: \(stockUpdate)"
        globalStockUpdate = String(stockUpdate)
        
        print(globalStockUpdate)

        
    
        
    }
    
    
    
    
    //Function to format View Controller
    func formatVC() {
        //Set background color
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Format Image
        imageOutletImageView.image = UIImage(named: "order.jpg")
        imageOutletImageView.layer.shadowOpacity = 1
        imageOutletImageView.layer.shadowRadius = 5
        imageOutletImageView.layer.cornerRadius = 15
        imageOutletImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        //Format Button
        stockLookupOutletButton.setTitleColor(.blue, for: .normal)
        stockLookupOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        stockLookupOutletButton.layer.shadowOpacity = 1
        stockLookupOutletButton.layer.shadowRadius = 5
        stockLookupOutletButton.layer.cornerRadius = 10
        stockLookupOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        saveOutletButton.setTitleColor(.blue, for: .normal)
        saveOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        saveOutletButton.layer.shadowOpacity = 1
        saveOutletButton.layer.shadowRadius = 5
        saveOutletButton.layer.cornerRadius = 10
        saveOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        updateCostOutletButton.setTitleColor(.blue, for: .normal)
        updateCostOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateCostOutletButton.layer.shadowOpacity = 1
        updateCostOutletButton.layer.shadowRadius = 5
        updateCostOutletButton.layer.cornerRadius = 10
        updateCostOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        //Format Text Fields
        
        invoiceNumberOutletText.layer.shadowOpacity = 1
        invoiceNumberOutletText.layer.shadowRadius = 5
        invoiceNumberOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        invoiceNumberOutletText.autocapitalizationType = .allCharacters
        invoiceNumberOutletText.isUserInteractionEnabled = false
        
        itemCodeOutletText.layer.shadowOpacity = 1
        itemCodeOutletText.layer.shadowRadius = 5
        itemCodeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemCodeOutletText.clearButtonMode = .always
        itemCodeOutletText.autocapitalizationType = .allCharacters //Set case to uppercase
        
        firstnameOutletText.layer.shadowOpacity = 1
        firstnameOutletText.layer.shadowRadius = 5
        firstnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        firstnameOutletText.clearButtonMode = .always
        
        lastnameOutletText.layer.shadowOpacity = 1
        lastnameOutletText.layer.shadowRadius = 5
        lastnameOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        lastnameOutletText.clearButtonMode = .always
        
    
        
        
        itemOutletText.layer.shadowOpacity = 1
        itemOutletText.layer.shadowRadius = 5
        itemOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemOutletText.clearButtonMode = .always
        
        descriptionOutletText.layer.shadowOpacity = 1
        descriptionOutletText.layer.shadowRadius = 5
        descriptionOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        descriptionOutletText.clearButtonMode = .always
        
        unitCostOutletText.layer.shadowOpacity = 1
        unitCostOutletText.layer.shadowRadius = 5
        unitCostOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        unitCostOutletText.clearButtonMode = .always
        
        quantityOutletText.layer.shadowOpacity = 1
        quantityOutletText.layer.shadowRadius = 5
        quantityOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        quantityOutletText.clearButtonMode = .always
        
        
    }
    
    //Form Action buttons
    
    //Home Item Action with Identifier (ordersInputForm) To (MainMenuVC)
    @IBAction func homeMenuActionItem(_ sender: UIBarButtonItem) {
        
        //Set Storyboard
        let ordersStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set OrdersForm
        let homeMenu = ordersStoryBoard.instantiateViewController(withIdentifier: "MainMenuVC") as! UfoTech_Merchants
        
        //Call Home Menu
        self.present(homeMenu, animated: true, completion: nil)
        
    }
    
    
    //Function to update produce stock
    func updateProdStock() {
        
        //Hold Item Code for predicate
        var localItemCode = String()
        localItemCode = itemCodeOutletText.text!
        
        //Set the context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        //Set the Product Entity
        let prodEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        
        //Predicate
        prodEntity.predicate = NSPredicate(format: "itemCode == %@", localItemCode)
        
        prodEntity.returnsObjectsAsFaults = false
        
        do {
            let getResults = try context.fetch(prodEntity)
            if getResults.count > 0 {
                for getResult in getResults as! [NSManagedObject] {
                    if localItemCode == getResult.value(forKey: "itemCode") as? String {
                        print(globalStockUpdate)
                        getResult.setValue(globalStockUpdate, forKey: "quantity")
                        
                    }
                
                }
            }
        } catch {
            print("Record not found")
        }
        
        //Save records
        
        do {
            try context.save()
        } catch {
            print("Unable to save record")
        }
    }
    
    //Function to lookup products
    func newOrders(inLookup: String) {
        
        //Variable to hold quantity value
        var qtyInfo = String()
      
        
        
        
        //Set context Produce and Orders Entity
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Declare Entities
        let prodEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        //NSPredicate
        prodEntity.predicate = NSPredicate(format: "itemCode == %@", inLookup)
        
       
        
        //Fault result
        prodEntity.returnsObjectsAsFaults = false
        
        globalItemCode = inLookup
    
        
        
        //Fetch record
        
        do {
            
            let results = try context.fetch(prodEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let resItemCode = result.value(forKey: "itemCode") as? String {
                            
                            print(" record \(resItemCode) found")
                            //Assign values to form Text fields
                            itemCodeOutletText.text = result.value(forKey: "itemCode") as? String
                            itemOutletText.text = result.value(forKey: "item") as? String
                            descriptionOutletText.text = result.value(forKey: "itemDescription") as? String
                            unitCostOutletText.text = result.value(forKey: "unitCost") as? String
                           
                            
                            qtyInfo = result.value(forKey:  "quantity") as! String
                            infoStockQtyLabel.text = "Qty: \(qtyInfo)"
                            
                            //Update global variable
                            prodStockUpdate = qtyInfo
                            
                            
                            //Initial value for Unit and Quantity
                            quantityOutletText.text = "0.0"
                            
                            //Calculate order
                           let convertUnitCost = Double(unitCostOutletText.text!)
                           let convertQty = Double(quantityOutletText.text!)
                            
                            let ordCost = calcOrder(inUnitCost: convertUnitCost!, inQty: convertQty!)
                            
                            print("Total Cost:£ \(ordCost)")
                            
                            orderCostOutletLabel.text = "Total Cost: £\(String(ordCost))"
                            
                            //Assign Ordercost to global variable
                            globalOrderCost = ordCost
                            
                            
                            //Infomation screen
                            lookupOutletInfoLabel.textColor = UIColor.blue
                            lookupOutletInfoLabel.text = "Record Found"
                            
                            //Clear the Info Screen
                            infoDelay()
                            
                            
                            
                        }
                    }
                } else {
             
                            print("No record found")
                            lookupOutletInfoLabel.textColor = UIColor.red
                            lookupOutletInfoLabel.text = "No record found"
                
                            //Clear the Info Screen
                            infoDelay()
                    
                }
            } catch {
                            print("Catch Error!!!")
            }
        
            //save record
        
        do {
            try context.save()
            
            
        } catch {
            
            print("Unable to update record")
        }
        
    
        
        
}
    
    
    
    
    
    
    //Function to save new record
    
    func saveNewOrder() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Declare Entities
        let ordEntiry = NSEntityDescription.entity(forEntityName: "Orders", in: context)

        
        //To allow for new record to be entered
        let newOrder = NSManagedObject(entity: ordEntiry!, insertInto: context)
        
        //Error checking
        guard invoiceNumberOutletText.text != nil else {
            print("Found nil in invoice field")
            return
        }
        
        guard itemCodeOutletText.text != nil else {
            print("Found nil in Item Code field")
            return
        }
        
        guard firstnameOutletText.text != nil else {
            print("Found nil in Firstname field")
            return
        }
        
        guard lastnameOutletText.text != nil else {
            print("Found nil in Lastname field")
            return
        }
        
        guard itemOutletText.text != nil else {
            print("Found nil in Item field")
            return
        }
        
        guard descriptionOutletText.text != nil else {
            print("Found nil in Description field")
            return
        }
        
        guard unitCostOutletText.text != nil else {
            print("Found nil in the Unit Cost field")
            return
        }
        
        guard quantityOutletText.text != nil else {
            print("Found nil in the Quantity field")
            return
        }
        
        guard orderCostOutletLabel.text != nil else {
            print("Found nil in Order Cost field")
            return
        }
        
        //******* Error Checking Ends ************
        
        //New orders insert
        
        let invoiceConvert = Int(invoiceNumberOutletText.text!)
        newOrder.setValue(invoiceConvert, forKey: "invoiceNo")
        newOrder.setValue(itemCodeOutletText.text, forKey: "itemCode")
        newOrder.setValue(firstnameOutletText.text, forKey: "firstname")
        newOrder.setValue(lastnameOutletText.text, forKey: "lastname")
        newOrder.setValue(itemOutletText.text, forKey: "item")
        newOrder.setValue(descriptionOutletText.text, forKey: "itemDescription")
        newOrder.setValue(unitCostOutletText.text, forKey: "unitCost")
        newOrder.setValue(quantityOutletText.text, forKey: "quantity")
        newOrder.setValue(globalOrderCost, forKey: "orderCost")
        
        //Save record
        
        do {
            
            try context.save()
                infoSavedOutletLabel.textColor = UIColor.blue
                infoSavedOutletLabel.text = "New Order saved successfully"
            
            //Delay and clear fields and reset invoice
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.infoSavedOutletLabel.text = " "
                
                
                self.autoInvoiceNumber()
                self.itemCodeOutletText.text = ""
                self.firstnameOutletText.text = ""
                self.lastnameOutletText.text = ""
                self.itemOutletText.text = ""
                self.descriptionOutletText.text = ""
                self.unitCostOutletText.text = ""
                self.quantityOutletText.text = ""
                self.infoStockQtyLabel.text = ""
                self.orderCostOutletLabel.text = ""
                
            }
            
            
            
            
        } catch {
            
            print("Unable to save record")
        }
        
        
    }

    
    //Function calculate cost
    func calcOrder(inUnitCost: Double, inQty: Double) -> Double {
        
        //Calculate Order Cost
        
        //Temp variable to calculate Order cost
        var tempCost = 0.0
        let convertUnitCost = inUnitCost
        let convertQuantity = inQty
        
        //Calculate
        tempCost = convertUnitCost * convertQuantity
        print("Total Order cost is \(tempCost)")
        
        return tempCost
    }
    
    //Function Product Stock update
    





    //Function to auto-complete invoice number
    func autoInvoiceNumber() {
        
        var invoiceCont = 0
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let orderEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Orders")
        
        //Check result faults
        orderEntity.returnsObjectsAsFaults = false
        
        //Check CoreData
        do {
            let results = try context.count(for: orderEntity)
            
            
            invoiceCont = results + 1
            invoiceNumberOutletText.text = String(invoiceCont)
             print("The results is \(invoiceCont)")
            
        } catch {
            print("Count did not work")
        }
    }
    
    //Function to delay infomation
    func infoDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.lookupOutletInfoLabel.text = ""
        }
    }
    
    
    
    


}
