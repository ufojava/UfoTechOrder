//
//  reportsMainMenuVC.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 02/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

//Reports Main Menu
class reportsMainMenuVC: UIViewController {
    
    //Reports Outlet
    @IBOutlet weak var reportsImageOutletImageView: UIImageView!
    @IBOutlet weak var reportsTitleManuLabel: UILabel!
    @IBOutlet weak var allProduceOutletMenuButton: UIButton!
    @IBOutlet weak var allOrdersOutletButton: UIButton!
    @IBOutlet weak var singleOrdersOutletButton: UIButton!
    @IBOutlet weak var buttonFrameImageviewOutlet: UIImageView!
    @IBOutlet weak var stockQtyOutletButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Functions
        fomratVC()
    }
    
    //Action Buttons
    
    //All Produce Reports with Identifier (allProduceReport)
    @IBAction func allProduceReportActionButton(_ sender: UIButton) {
        
        //Main Storyboard
        let allProdStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Variable
        let allProduceRpt = allProdStoryBoard.instantiateViewController(withIdentifier: "allProduceReport") as! AllReportVC
        
        //Assign variable
        self.present(allProduceRpt, animated: true, completion: nil)
        
    }
    
    //All Orders Reports
    @IBAction func allOrdersReportActionButton(_ sender: UIButton) {
        
        //Programatically go to the Orders View controller - Identifier (allOrdersRptVC)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let rptAllOrders = storyBoard.instantiateViewController(withIdentifier: "allOrdersRptVC") as! AllOrdersReport_VC
            self.present(rptAllOrders , animated: true, completion: nil)
        
    }
    
    //Back to home menu Identifier MainMenuVC
    @IBAction func homeMenuActionItem(_ sender: UIBarButtonItem) {
        //Main Storyboard
        let homeStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Home Identifier
        let homeMenu = homeStoryBoard.instantiateViewController(withIdentifier: "MainMenuVC") as! UfoTech_Merchants
        
        //Call the Home Menu
        self.present(homeMenu, animated: true, completion: nil)
        
    }
    
    //Product stock Quantity with Identifier (prodStockQty)
    @IBAction func stockQuantityActionButton(_ sender: UIButton) {
        
        //Set Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Stock Quantity Report View Controller
        let stockQty = mainStoryBoard.instantiateViewController(withIdentifier: "prodStockQty") as! StockQuantity_VC
        
        //Call View Controller
        self.present(stockQty,animated: true, completion: nil)
        
        
    }
    
    
    
    
    //Search Produce Report
    @IBAction func searchProduceReportActionButton(_ sender: UIButton) {
    }
    
    //Search Orders Report
    @IBAction func sarchOrdersReportActionButton(_ sender: UIButton) {
    }
    
    //Action Buttons
    


    //Format View Controller buttons
    func fomratVC() {
        
        //Set background
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Set Image
        reportsImageOutletImageView.image = UIImage(named: "rptMainMenu.jpg")
        reportsImageOutletImageView.layer.shadowOpacity = 1
        reportsImageOutletImageView.layer.shadowRadius = 5
        reportsImageOutletImageView.layer.cornerRadius = 15
        reportsImageOutletImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        buttonFrameImageviewOutlet.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        buttonFrameImageviewOutlet.layer.shadowOpacity = 1
        buttonFrameImageviewOutlet.layer.shadowRadius = 5
        buttonFrameImageviewOutlet.layer.cornerRadius = 15
        buttonFrameImageviewOutlet.layer.shadowOffset = CGSize(width: 7, height: 7)
        
        //Set All Buttons
        allProduceOutletMenuButton.setTitleColor(.blue, for: .normal)
        allProduceOutletMenuButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        allProduceOutletMenuButton.layer.shadowOpacity = 1
        allProduceOutletMenuButton.layer.shadowRadius = 5
        allProduceOutletMenuButton.layer.cornerRadius = 10
        allProduceOutletMenuButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        allOrdersOutletButton.setTitleColor(.blue, for: .normal)
        allOrdersOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        allOrdersOutletButton.layer.shadowOpacity = 1
        allOrdersOutletButton.layer.shadowRadius = 5
        allOrdersOutletButton.layer.cornerRadius = 10
        allOrdersOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        singleOrdersOutletButton.setTitleColor(.blue, for: .normal)
        singleOrdersOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        singleOrdersOutletButton.layer.shadowOpacity = 1
        singleOrdersOutletButton.layer.shadowRadius = 5
        singleOrdersOutletButton.layer.cornerRadius = 10
        singleOrdersOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        stockQtyOutletButton.setTitleColor(.blue, for: .normal)
        stockQtyOutletButton.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        stockQtyOutletButton.layer.shadowOpacity = 1
        stockQtyOutletButton.layer.shadowRadius = 5
        stockQtyOutletButton.layer.cornerRadius = 10
        stockQtyOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        
        
        
        
        
        
    }
    



}
