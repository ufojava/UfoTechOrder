//
//  AllOrdersReport_VC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 03/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

//All Orders Report View Controller
class AllOrdersReport_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    
    
}
