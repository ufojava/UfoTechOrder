//
//  ordersTableViewCell.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 08/08/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class ordersTableViewCell: UITableViewCell {
    
    //TableView Cell Outlet
    @IBOutlet weak var invoiceNoCellOutletText: UILabel!
    @IBOutlet weak var firstnameOutletCellText: UILabel!
    @IBOutlet weak var lastnameOutletCellText: UILabel!
    @IBOutlet weak var itemOutletCellText: UILabel!
    @IBOutlet weak var quantityOutletCellText: UILabel!
    @IBOutlet weak var costOutletCellText: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
