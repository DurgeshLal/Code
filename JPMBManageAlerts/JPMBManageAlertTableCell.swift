//
//  JPMBManageAlertTableCell.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/21/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var controlSwitch: JPMBSwitch!
    
    weak var delegate:JPMBManagAlertsDelegate?
    
    var data: JPMBManageAlertsDetailCellData = JPMBManageAlertsDetailCellData(cellDetailIdentifier: "", cellDetailTitle: "", cellDetailDescription: "", cellDetailState: false){
        didSet {
            if let title = data.cellDetailTitle {
                titleLabel.text = title
            }
            
            if let description = data.cellDetailDescription {
                descriptionLabel.text = description
            }
            
            if let isON = data.cellDetailState {
                controlSwitch.isOn = isON
            }
        }
    }
   
    override func prepareForReuse() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        controlSwitch.isOn = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: IBAction
    @IBAction func switchState(_ sender: JPMBSwitch) {
        self.delegate?.stateChanged?(sender: sender)
    }

}
