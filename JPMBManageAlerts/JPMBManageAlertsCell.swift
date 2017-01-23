//
//  JPMBManageAlertsCell.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    var data = JPMBManageAlertsCellData(cellTitle: "" , cellData: [JPMBManageAlertsDetailData]()){
        didSet {
            if let title = data.cellTitle {
                cellTitle.text = title
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellTitle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
