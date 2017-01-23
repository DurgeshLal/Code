//
//  JPMBManageAlertsTableVC.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/21/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsTableVC: UIViewController {

    var dataSource: [JPMBManageAlertsDetailCellData] = [JPMBManageAlertsDetailCellData](){
        didSet{
            if let tableView = tableView {
                tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()
    }
    
    func internalSetup() -> Void {
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension JPMBManageAlertsTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "manageAlertsTableCell", for: indexPath) as! JPMBManageAlertTableCell
        cell.data = cellData
        cell.controlSwitch.indexPath = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension JPMBManageAlertsTableVC: JPMBManagAlertsDelegate {
    func stateChanged(sender: JPMBSwitch) -> Void {
        dataSource[sender.indexPath!].cellDetailState = sender.isOn
    }
}
