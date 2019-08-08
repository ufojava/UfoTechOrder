//
//  UfoTech_Merchants.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 16/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class UfoTech_Merchants: UIViewController {

    //Home Page Outlet

    @IBOutlet weak var slidebarOutletUIView: UIView!
    @IBOutlet weak var menuHamburgerOutlet: UIBarButtonItem!
    
    @IBOutlet var mainTitleOutletLable: UIView!
    
    
    //Outlet Constraint
    @IBOutlet weak var slidebarLeadingOutletConstraint: NSLayoutConstraint!
    
    //Variable to monitor slidemenu to false
    var menuBarShowing = false
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        // Custom functions
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        formatMainMenu()
    
    }
    
    //Format menu
    func formatMainMenu() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "VC_Background.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format slidebar
        slidebarLeadingOutletConstraint.constant = -156
        

    }
    
    //Action Buttons
    
    //Reports Menu Button with Identifier (reportMenuVC)
    @IBAction func rptMainMenuButton(_ sender: UIButton) {
        
        //Set Storyboard
        let mainMenuStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set RptMainMenu
        let rptMainMenu = mainMenuStoryBoard.instantiateViewController(withIdentifier: "reportMenuVC") as! reportsMainMenuVC
        
        //Call Report Menu
        self.present(rptMainMenu,animated: true, completion: nil)
    }
    
    
    //Orders entry with identifier (ordersInputForm)
    @IBAction func ordersInputFormButton(_ sender: UIButton) {
        
        //Set StoryBoard
        let mainMenuStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Orders Form
        let ordersInputForm = mainMenuStoryBoard.instantiateViewController(withIdentifier: "ordersInputForm") as! OrderForm_VC
        
        //Call Orders Input Form
        self.present(ordersInputForm, animated: true, completion: nil)
        
    }
    
    
    //Produce entry form with Identifier 0 (productInputForm)
    @IBAction func productInputFormButton(_ sender: UIButton) {
        //Set Storyboard
        let mainMenuStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Produce Form
        let prodInputForm = mainMenuStoryBoard.instantiateViewController(withIdentifier: "productInputForm") as! Product_VC
        
        //Call Produce form
        self.present(prodInputForm, animated: true, completion: nil)
    }
    
    
    //Produce and Orders Records Update and Delete with Identifier (updateDeleteMenu)
    @IBAction func prodOrdersUpdateDelete(_ sender: UIButton) {
        
        //Set Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Orders and Produce Main Menu
        let prodOrdersMenu = mainStoryBoard.instantiateViewController(withIdentifier: "updateDeleteMenu") as! prodOrdersUpdate
        
        //Call Produce and Orders
        self.present(prodOrdersMenu,animated: true, completion: nil)
        
    }
    
    
    
    
    
    


    
    
    //Menubar Action
    @IBAction func menuActionButton(_ sender: UIBarButtonItem) {
        
        if(menuBarShowing) {
            slidebarLeadingOutletConstraint.constant = -156
            
        }else {
            slidebarLeadingOutletConstraint.constant = 0
            UIAnimate()
        }
        
        menuBarShowing = !menuBarShowing
        UIAnimate()
    }
    
    
    //Function to animate slide bar
    
    func UIAnimate() {
        UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
    }

  
}
