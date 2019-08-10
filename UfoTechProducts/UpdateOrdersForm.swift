//
//  UpdateOrdersForm.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 11/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class UpdateOrdersForm: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

}
