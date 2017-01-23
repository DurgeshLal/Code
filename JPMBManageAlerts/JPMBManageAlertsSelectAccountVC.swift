//
//  JPMBManageAlertsSelectAccountVC.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsSelectAccountVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()

    }
    func internalSetup() -> Void {
        tableView.tableFooterView = UIView()
    }
}


extension JPMBManageAlertsSelectAccountVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectAccountCell", for: indexPath) as! JPMBManageAlertsSelectAccountCell
        cell.selectAccountLabel.text = "Select Account"
        return cell
    }
}
