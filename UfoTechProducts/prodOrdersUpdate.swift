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
    @IBOutlet weak var updateDeleteOutletOrdersButton: UIButton!
    
    

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
        updateDeleteOutletOrdersButton.setTitleColor(.blue, for: .normal)
        updateDeleteOutletOrdersButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        updateDeleteOutletOrdersButton.layer.shadowOpacity = 1
        updateDeleteOutletOrdersButton.layer.shadowRadius = 5
        updateDeleteOutletOrdersButton.layer.cornerRadius = 10
        updateDeleteOutletOrdersButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        
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
    
    //Orders Update and Delete Action Buttons Identifier (updateDeleteMenu)
    @IBAction func ordersUpdateDeleteActionButton(_ sender: UIButton) {
    }
    
    



}
