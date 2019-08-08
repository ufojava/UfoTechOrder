//
//  ReportTableViewCell.swift
//  UfoTechProducts
//
//  Created by Ufuoma Okoro on 20/07/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
   //Cell Outlet
    @IBOutlet weak var itemCodeOutletCell: UILabel!
    @IBOutlet weak var itemOutletCell: UILabel!
    @IBOutlet weak var descriptionOutletCell: UILabel!
    @IBOutlet weak var quantityOutletCell: UILabel!
    @IBOutlet weak var unitCostOutletCell: UILabel!
    @IBOutlet weak var totalCostOutletCell: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
  

}
