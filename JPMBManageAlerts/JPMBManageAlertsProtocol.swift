//
//  JPMBManageAlertsProtocol.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/21/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import Foundation


@objc protocol JPMBManagAlertsDelegate {
    @objc optional func stateChanged(sender: JPMBSwitch) -> Void
}
