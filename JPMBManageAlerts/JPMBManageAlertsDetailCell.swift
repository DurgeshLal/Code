//
//  JPMBManageAlertsDetailCell.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsDetailCell: UICollectionViewCell {
    
    var _controller: JPMBManageAlertsTableVC?
    lazy var controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JPMBManageAlertsTableVC") as! JPMBManageAlertsTableVC
    
    var data: JPMBManageAlertsDetailData = JPMBManageAlertsDetailData(cellDetailIdentifier: "", cellDetailData: nil){
        didSet{
            self.contentView.addSubview(controller.view)
            controller.dataSource = data.cellDetailData!
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        controller.view.frame = self.contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        controller.dataSource = []
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
