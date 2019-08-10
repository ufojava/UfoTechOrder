//
//  prodOrdersUpdate.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 05/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

//Produce and Orders Update and Delete Menu
class prodOrdersUpdate: UIViewController {
    
    //Button an Image Outlets
    @IBOutlet weak var menuImageOutletView: UIImageView!
    @IBOutlet weak var optionsImageOutletView: UIImageView!
    @IBOutlet weak var updateDeleteProduceOutletButton: UIButton!
    @IBOutlet weak var deleteOrdersOutletButton: UIButton!
    @IBOutlet weak var updateOrdersOutletButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Call custom functions
        formatVC()
    }
    
    
    //Format Update and Delete Menu
    
    func formatVC() {
    
        //Background colour
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Format VC Logo image
        menuImageOutletView.image = UIImage(named: "coreDataDatabase.png")
        menuImageOutletView.layer.shadowOpacity = 1
        menuImageOutletView.layer.shadowRadius = 5
        menuImageOutletView.layer.cornerRadius = 15
        menuImageOutletView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        //Format Options ImageView
        optionsImageOutletView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        optionsImageOutletView.layer.shadowOpacity = 1
        optionsImageOutletView.layer.shadowRadius = 5
        optionsImageOutletView.layer.cornerRadius = 15
        optionsImageOutletView.layer.shadowOffset = CGSize(width: 7, height: 7)
        
        //Format Option Buttons
        updateDeleteProduceOutletButton.setTitleColor(.blue, for: .normal)
        updateDeleteProduceOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateDeleteProduceOutletButton.layer.shadowOpacity = 1
        updateDeleteProduceOutletButton.layer.shadowRadius = 5
        updateDeleteProduceOutletButton.layer.cornerRadius = 10
        updateDeleteProduceOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        //Format Option Buttons
        deleteOrdersOutletButton.setTitleColor(.blue, for: .normal)
        deleteOrdersOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        deleteOrdersOutletButton.layer.shadowOpacity = 1
        deleteOrdersOutletButton.layer.shadowRadius = 5
        deleteOrdersOutletButton.layer.cornerRadius = 10
        deleteOrdersOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        updateOrdersOutletButton.setTitleColor(.blue, for: .normal)
        updateOrdersOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateOrdersOutletButton.layer.shadowOpacity = 1
        updateOrdersOutletButton.layer.shadowRadius = 5
        updateOrdersOutletButton.layer.cornerRadius = 10
        updateOrdersOutletButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        
    }
    
    //Action Buttons
    
    //Back to home menu Identifier (MainMenuVC)
    @IBAction func homeMainMenuActionItem(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Main Menu
        let homeMenu = mainStoryBoard.instantiateViewController(withIdentifier: "MainMenuVC") as! UfoTech_Merchants
        
        //Call Home Menu
        self.present(homeMenu, animated: true, completion: nil)
        
    }
    
    //Produce Update and Delete Action Button with Identifier (updateDeleteMenu)
    @IBAction func productUpdateDeleteActionItem(_ sender: UIButton) {
        
        //Set Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Orders and Produce Main Menu
        let prodOrdersMenu = mainStoryBoard.instantiateViewController(withIdentifier: "prodUpdateDeleteForm") as! SearchFormVC
        
        //Call Produce and Orders
        self.present(prodOrdersMenu,animated: true, completion: nil)
        
    }
    

    /*
     The notes here is to describe deletion of orders which can be carried out from the Reports Menu.
     The Produce  / Orders Update menu was originally slated to carry out this task.
     I will now enable a segue operation to the Single orders report from where a deletion can be performed.
     The home operation will take use back to the Reports menu.
     
     Identifier - allOrdersRptVC - deletetion in orders
    */
    
    @IBAction func deleteOrdersActionButton(_ sender: UIButton) {
        //Set MainStoryBoard
        let mainStoryBaord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Destination
        let deleteOrders = mainStoryBaord.instantiateViewController(withIdentifier: "allOrdersRptVC") as! AllOrdersReport_VC
        
        //Call All Orders function
        self.present(deleteOrders,animated: true, completion: nil)
        
    }
    
    //STOPPED HERE***
    //Update Orders with Identifier (updateOrders) and ViewController (UpdateOrdersForm)
    @IBAction func updateOrdersAcrionButton(_ sender: UIButton) {
        
        //Set main StoryBoard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Destination VC
        let ordersUpdateForm = mainStoryboard.instantiateViewController(withIdentifier: "updateOrders") as! UpdateOrdersForm
        
        //Call function
        self.present(ordersUpdateForm,animated: true,completion: nil)
        
    }
    
    
    
    
    
    
}
