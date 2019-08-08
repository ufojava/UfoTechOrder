//
//  StockQuantity_VC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 21/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


class StockQuantity_VC: UIViewController {
    
    //Outlet for View Controller
    @IBOutlet var stockQtyOutletViewController: UIView!
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var itemCodeOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var itemOutletTextLabel: UILabel!
    @IBOutlet weak var descriptionOutletTextLabel: UILabel!
    @IBOutlet weak var unitCostOutletTextLabel: UILabel!
    @IBOutlet weak var quantityOutletTextLabel: UILabel!
    @IBOutlet weak var stockValueOutletTextValue: UILabel!
    @IBOutlet weak var resultInfoOutletLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Format VC
        formatVC()
    }
    
    //Button Action
    @IBAction func searchActionButton(_ sender: UIButton) {
        
        //Call Search Database
        productSrch(inProdCode: itemCodeOutletText.text!)
    }
    
    //Report menu button with Identifier - (reportMenuVC)
    @IBAction func reportMenuActionMenu(_ sender: UIBarButtonItem) {
        
        //Set Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Report Main Mneu
        let reportMenu = mainStoryBoard.instantiateViewController(withIdentifier: "reportMenuVC") as! reportsMainMenuVC
        
        //Call Report Main Menu
        
        self.present(reportMenu,animated: true, completion: nil)
        
    }
    
    
    

    //Format View Controller
    func formatVC() {
    
        //Set background color
        stockQtyOutletViewController.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Set ImageView Image
        stockImage.image = UIImage(named: "stockQty.png")
        
        //Format Search Button
        searchOutletButton.setTitleColor(.blue, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 10
        searchOutletButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        
       
        //Format Text field
        itemCodeOutletText.layer.shadowOpacity = 1
        itemCodeOutletText.layer.shadowRadius = 5
        itemCodeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        itemCodeOutletText.clearButtonMode = .always
        itemCodeOutletText.autocapitalizationType = .allCharacters //Set all characters to upper case
        
        
    
        
    }
    
    //Function to retreive specific produce data
    func productSrch(inProdCode: String) {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Declare entity
        let productEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        
        //Set Predicate format
        productEntity.predicate = NSPredicate(format: "itemCode ==%@", inProdCode)
        
        //Set result fault
        productEntity.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(productEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let resItemCode = result.value(forKey: "itemCode") as? String {
                            
                            
                            print("Item found \(resItemCode)")
                            resultInfoOutletLabel.textColor = UIColor.brown
                            resultInfoOutletLabel.text = "Record Found!!!"
                            
                            //Assign results to lables
                            itemOutletTextLabel.textColor = UIColor.blue
                            let item  =  result.value(forKey: "item") as? String
                            itemOutletTextLabel.text = "Item: \(item!)"
                            
                            descriptionOutletTextLabel.textColor = UIColor.blue
                            let description = result.value(forKey: "itemDescription") as? String
                            descriptionOutletTextLabel.text = "Desc: \(description!)"
                            
                            unitCostOutletTextLabel.textColor = UIColor.blue
                            let unitCost  = result.value(forKey: "unitCost") as? String
                            unitCostOutletTextLabel.text = " Unit Cost \(unitCost!)"
                            
                            quantityOutletTextLabel.textColor = UIColor.blue
                            let quantity = result.value(forKey: "quantity") as? String
                            quantityOutletTextLabel.text = "Qty: \(quantity!)"
                            
                            stockValueOutletTextValue.textColor = UIColor.blue
                            let value = result.value(forKey: "totalCost") as? Double
                            stockValueOutletTextValue.text = "Value: £\(value!)"
                            
                            //Delay to clear info screen
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                self.resultInfoOutletLabel.text = ""
                            }
                         
                            
                        }
                    }
                } else {
                    
                    resultInfoOutletLabel.textColor = UIColor.red
                    resultInfoOutletLabel.text = "No Record Found!!!"
                    
                    //Clear Screen
                    itemOutletTextLabel.text = ""
                    descriptionOutletTextLabel.text = ""
                    unitCostOutletTextLabel.text = ""
                    quantityOutletTextLabel.text = ""
                    stockValueOutletTextValue.text = ""
                    
                    //Delay to clear info screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.resultInfoOutletLabel.text = ""
                    }
                    
                    
                    
                    
            }
        } catch {
            
            print("Unable to retreive record")
        }
        
      
        
    }
    
    

}
