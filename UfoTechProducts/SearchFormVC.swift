//
//  SearchFormVC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 26/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Saerch Form
class SearchFormVC: UIViewController {
    
    //Outlet fields, background and buttons
    @IBOutlet weak var imageOutletView: UIImageView!
    @IBOutlet weak var codeSrchOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var itemOutletLabel: UILabel!
    @IBOutlet weak var descriptionOutletLabel: UILabel!
    @IBOutlet weak var newItemCodeOutletText: UITextField!
    @IBOutlet weak var newItemOutletText: UITextField!
    @IBOutlet weak var newDescriptionOutletText: UITextField!
    @IBOutlet weak var newQuantityOutletTest: UITextField!
    @IBOutlet weak var updateOutletButton: UIButton!
    @IBOutlet weak var deleteOutletButton: UIButton!
    @IBOutlet weak var actionInfoOutputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // custom Functions
        formatVC()
    }
    
    //Action buttons
    
    //Search record Button
    @IBAction func searchActionButton(_ sender: UIButton) {
        getSrchDataUpdate(inSearch: codeSrchOutletText.text!)
    }
    
    //Update Button
    @IBAction func updateActionButton(_ sender: UIButton) {
        getSrchDataUpdate(inSearch: codeSrchOutletText.text!)
        
    }
    
    //Delete Button
    @IBAction func deleteActionButton(_ sender: UIButton) {
        //Call function to delete CoreData
        delProdData(inSearch: codeSrchOutletText.text!)
    }
    
 


    
    //Format View Controller
    func formatVC() {
        
        //Set Background Color
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Set Image formar
        imageOutletView.image = UIImage(named: "updateImage.png")
        imageOutletView.layer.shadowOpacity = 1
        imageOutletView.layer.shadowRadius = 5
        imageOutletView.layer.cornerRadius = 15
        imageOutletView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        //Text Field format
        codeSrchOutletText.layer.shadowOpacity = 1
        codeSrchOutletText.layer.shadowRadius = 5
        codeSrchOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        codeSrchOutletText.clearButtonMode = .always
        codeSrchOutletText.autocapitalizationType = .allCharacters
        
        newItemCodeOutletText.layer.shadowOpacity = 1
        newItemCodeOutletText.layer.shadowRadius = 5
        newItemCodeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        newItemCodeOutletText.clearButtonMode = .always
        
        newItemOutletText.layer.shadowOpacity = 1
        newItemOutletText.layer.shadowRadius = 5
        newItemOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        newItemOutletText.clearButtonMode = .always
        
        newDescriptionOutletText.layer.shadowOpacity = 1
        newDescriptionOutletText.layer.shadowRadius = 5
        newDescriptionOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        newDescriptionOutletText.clearButtonMode = .always
        
        newQuantityOutletTest.layer.shadowOpacity = 1
        newQuantityOutletTest.layer.shadowRadius = 5
        newQuantityOutletTest.layer.shadowOffset = CGSize(width: 3, height: 3)
        newQuantityOutletTest.clearButtonMode = .always
        
        
        //Format Buttons
        searchOutletButton.setTitleColor(.blue, for: .normal)
        searchOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        searchOutletButton.layer.shadowOpacity = 1
        searchOutletButton.layer.shadowRadius = 5
        searchOutletButton.layer.cornerRadius = 10
        searchOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)

        updateOutletButton.setTitleColor(.blue, for: .normal)
        updateOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateOutletButton.layer.shadowOpacity = 1
        updateOutletButton.layer.shadowRadius = 5
        updateOutletButton.layer.cornerRadius = 10
        updateOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        deleteOutletButton.setTitleColor(.blue, for: .normal)
        deleteOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        deleteOutletButton.layer.shadowOpacity = 1
        deleteOutletButton.layer.shadowRadius = 5
        deleteOutletButton.layer.cornerRadius = 10
        deleteOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
    }
    
    //Back to Update Main Menu with Identifier - (updateDeleteMenu)
    @IBAction func backToUpdateDeleteMenuActionItem(_ sender: UIBarButtonItem) {
        
        //Set Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Update Delete Menu
        let updateDeleteMenu = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteMenu") as! prodOrdersUpdate
        
        //Call Update and Delete menu
        self.present(updateDeleteMenu,animated: true, completion: nil)
        
    }
    
    
    
    
    //Get produce from CoreData
    func getSrchDataUpdate(inSearch: String) {
        
        //Set Produce context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let prodEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        
        //Predicate Search
        prodEntity.predicate = NSPredicate(format: "itemCode == %@", inSearch)
        
        //Stop fault results
        prodEntity.returnsObjectsAsFaults = false
        
        
        //Checking the database
        
        do {
            
            let results = try context.fetch(prodEntity)
                if results.count > 0 {
                    for  result in results as! [NSManagedObject] {
                        if let resItemCode = result.value(forKey: "itemCode") as? String, let resItem = result.value(forKey: "item") as? String, let resDescription = result.value(forKey: "itemDescription") as? String {
                            
                            //Assign value to for search results
                            itemOutletLabel.text = "Item: \(resItem)"
                            descriptionOutletLabel.text = "Description: \(resDescription)"
                            
                            //Updating itemCode
                            if ((resItemCode == inSearch) && (newItemCodeOutletText.text != "")) {
                                result.setValue(newItemCodeOutletText.text, forKey: "itemCode")
                                //Output Infomation to screen
                                actionInfoOutputLabel.textColor = UIColor.blue
                                actionInfoOutputLabel.text = "Record Updated Successfully"
                                    
                                }
                            
                            if  ((resItemCode == inSearch) && (newItemOutletText.text != "")) {
                                result.setValue(newItemOutletText.text, forKey: "item")
                                //Output Infomation to screen
                                actionInfoOutputLabel.textColor = UIColor.blue
                                actionInfoOutputLabel.text = "Record Updated Successfully"
                            }
                            
                            if  ((resItemCode == inSearch) && (newDescriptionOutletText.text != "")) {
                                result.setValue(newDescriptionOutletText.text, forKey: "itemDescription")
                                //Output Infomation to screen
                                actionInfoOutputLabel.textColor = UIColor.blue
                                actionInfoOutputLabel.text = "Record Updated Successfully"
                            }
                            
                            if  ((resItemCode == inSearch) && (newQuantityOutletTest.text != "")) {
                                result.setValue(newQuantityOutletTest.text, forKey: "quantity")
                                //Output Infomation to screen
                                actionInfoOutputLabel.textColor = UIColor.blue
                                actionInfoOutputLabel.text = "Record Updated Successfully"
                            }
                        }
                        
                    }
            }
        } catch {
            print("Unable to retrieve record")
        }
        
        //Save set record
        
        do {
            try context.save()
            
        } catch {
            
            print("Unable to update record")
        }
    }
    
    
    //Function to delete CoreData Record
    func delProdData(inSearch: String) {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Produce Entity
        let prodEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Produce")
        
        prodEntity.predicate = NSPredicate(format: "itemCode == %@", inSearch)
        
        prodEntity.returnsObjectsAsFaults = false
        
        //Now loop through CoreData to check data
        
        do {
            
            let results = try context.fetch(prodEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if inSearch == result.value(forKey: "itemCode") as? String {
                        
                        //Delete Record
                        context.delete(result)
                        
                        //Output Infomation to screen
                        actionInfoOutputLabel.textColor = UIColor.blue
                        actionInfoOutputLabel.text = "Record deleted successfully"
                        delayDisplay()
                        
                    }
                }
            }
        } catch {
            print("Unable to delete record")
        }
        
        
        //Save the CoreData Produce Database
        do {
            try context.save()
            
        } catch {
            print("Unable to save Database")
        }
        
    }
    
    //Function ti delay clear display
    func delayDisplay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.actionInfoOutputLabel.text = ""
        }
    }
    
    

}
