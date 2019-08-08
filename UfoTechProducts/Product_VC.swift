//
//  Product_VC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 17/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

class Product_VC: UIViewController {
    
//Product Form Outlet
    @IBOutlet weak var itemCodeOutletText: UITextField!
    @IBOutlet weak var itemOutletText: UITextField!
    @IBOutlet weak var descriptionOutletText: UITextField!
    @IBOutlet weak var unitCostOutletText: UITextField!
    @IBOutlet weak var quantityOutletText: UITextField!
    @IBOutlet weak var costOutletLabel: UILabel!
    @IBOutlet weak var calculateOutletButton: UIButton!
    @IBOutlet weak var saveOutletButton: UIButton!
    @IBOutlet weak var dataEntryLogo: UIImageView!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var infoOutletLabel: UILabel!
    
    
    //Variable for Record Total Cost
    var totalCost = 0.0
    
    //Variable Item code
    var itemCodeSrch = String()
    
 


    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom function
        formatVC()
    }
    
    
    //Buttin Action
    
    //Calculate button
    @IBAction func calculateActionButton(_ sender: UIButton) {
        calc() //Calculate total cost
    }
    
    //Save new record
    @IBAction func saveActionButton(_ sender: UIButton) {
        newRecord()
    }
    
    //Back to home menu Identifier MainMenuVC
    @IBAction func mainMenuActionItem(_ sender: UIBarButtonItem) {
        //Set Home Storyboard
        let prodStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Home Identifier
        let homeMenu = prodStoryBoard.instantiateViewController(withIdentifier: "MainMenuVC") as! UfoTech_Merchants
        
        //Call the home menu
        self.present(homeMenu,animated: true, completion: nil)
    }
    
    
        
        
    
    
    
    
    
    
    
    //Format Product View Controller
    func formatVC() {
        
        //Background color
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Format Calculate button
        calculateOutletButton.setTitleColor(.blue, for: .normal)
        calculateOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        calculateOutletButton.layer.shadowOpacity = 1
        calculateOutletButton.layer.shadowRadius = 5
        calculateOutletButton.layer.cornerRadius = 10
        calculateOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Save button
        saveOutletButton.setTitleColor(.blue, for: .normal)
        saveOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        saveOutletButton.layer.shadowOpacity = 1
        saveOutletButton.layer.shadowRadius = 5
        saveOutletButton.layer.cornerRadius = 10
        saveOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Text Fields
        itemCodeOutletText.layer.shadowOpacity = 1
        itemCodeOutletText.layer.shadowRadius = 5
        itemCodeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemCodeOutletText.clearButtonMode = .always
        itemCodeOutletText.autocapitalizationType = .allCharacters //Set case to uppercase
        
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
        
        
        dataEntryLogo.image = UIImage(named: "dataEntryImage")
        dataEntryLogo.layer.shadowOpacity = 1
        dataEntryLogo.layer.shadowRadius = 5
        dataEntryLogo.layer.cornerRadius = 15
        dataEntryLogo.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
        
    }
    
    //CoreData CRUD functons
    
    
    //Function to calculate purchase
    func calc() {
        
        
        
        //Convert the String to doubles to for calculating total cost
        let convUnitCost = Double(unitCostOutletText.text!)
        let convQty = Double(quantityOutletText.text!)
        
        totalCost = convQty! * convUnitCost!
        
        //Checking for nil values in text field
        guard itemCodeOutletText.text != nil else {
            print("Nil valule found: Item Code")
            return
        }
        
        guard itemOutletText.text != nil else {
            print("Nil valule found: Item")
            return
        }
        
        guard descriptionOutletText.text != nil else {
            print("Nil valule found: Description")
            return
            
        }
        
        guard unitCostOutletText.text != nil else {
            print("Nil valule found: Unit Cost")
            return
        }
        guard quantityOutletText.text != nil else {
            print("Nil valule found: Quantity")
            return
        }
        
        
        //Assign Total cost to field
        totalAmountLabel.text = String(totalCost)
        //Check fields
        
          print(totalCost)
        
    }
    
    //Function to input data
    func newRecord() {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let prodEntity = NSEntityDescription.entity(forEntityName: "Produce", in: context)
        
            let newProduce = NSManagedObject(entity: prodEntity!, insertInto: context)
       
        
        //Process for item code exist
        let prodEntityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
            prodEntityFetch.predicate = NSPredicate(format: "itemCode == %@", itemCodeOutletText.text!)
            prodEntityFetch.returnsObjectsAsFaults = false
        
        
       
        
        
        //Checking for nil values in text field
        guard itemCodeOutletText.text != nil else {
            print("Nil valule found: Item Code")
            return
        }
        
        guard itemOutletText.text != nil else {
            print("Nil valule found: Item")
            return
        }
        
        guard descriptionOutletText.text != nil else {
            print("Nil valule found: Description")
        return
            
        }
        
        guard unitCostOutletText.text != nil else {
            print("Nil valule found: Unit Cost")
            return
        }
        guard quantityOutletText.text != nil else {
            print("Nil valule found: Quantity")
            return
        }
        
        //Set CoreData Value
        
        if totalCost == 0.0 {
            print("Click on the calculate before save")
        } else if totalCost > 0.0 {
            
            
            //Check for existing Item Code in CoreData - Produce
            
            do {
                let prodResults = try context.fetch(prodEntityFetch)
                    if prodResults.count > 0 {
                        for prodResult in prodResults as! [NSManagedObject] {
                            
                            if itemCodeOutletText.text == prodResult.value(forKey: "itemCode") as? String {
                                
                                
                                print("Item Code exist. Item will be updated")
                                
                                infoOutletLabel.textColor = UIColor.red
                                infoOutletLabel.text = "Item Code exist"
                                itemCodeSrch = itemCodeOutletText.text!
                                
                                prodResult.setValue(unitCostOutletText.text, forKey: "unitCost")
                                prodResult.setValue(quantityOutletText.text, forKey: "quantity")
                                prodResult.setValue(totalCost, forKey: "totalCost")
                                
                            }
                            
                            
                        }
                        
                        
                }
                
            } catch {
             
                print("Record updated")
            }
            
            //Save the update if the Item code exist
            
            do {
                
                try context.save()
                
                
            } catch {
                
                print("Unable to save")
            }
        }
        
        
            //If Item code does not exist, new record is entered into the CoreData
        
                            if itemCodeOutletText.text != itemCodeSrch {
            
                                
                                    print("Item does not exist, new Record")
                                
                                    //New Entity
            
                                
                                    newProduce.setValue(itemCodeOutletText.text, forKey: "itemCode")
                                    newProduce.setValue(itemOutletText.text, forKey: "item")
                                    newProduce.setValue(descriptionOutletText.text, forKey: "itemDescription")
                                    newProduce.setValue(unitCostOutletText.text, forKey: "unitCost")
                                    newProduce.setValue(quantityOutletText.text, forKey: "quantity")
                                    newProduce.setValue(totalCost, forKey: "totalCost")
                                
                            do {
                                    
                                    try context.save()
                                    infoOutletLabel.textColor = UIColor.black
                                    infoOutletLabel.text = "Record Saved Successfully"
                                    
                                    //Reset fields
                                    itemCodeOutletText.text = ""
                                    itemOutletText.text = ""
                                    descriptionOutletText.text = ""
                                    unitCostOutletText.text = ""
                                    quantityOutletText.text = ""
                                    totalAmountLabel.text = ""
                                    
                                    //Delay the record saved display
                                    delayDisplay()
                                    
                                    
                            } catch {
                                    print("Unable to save record")
                                }
                                
                            }
                            
            }
    
    
    
    //Function to delay clear display
    func delayDisplay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.infoOutletLabel.text = ""
        }
    }
                        


}
                    

    
  


