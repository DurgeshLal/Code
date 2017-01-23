//
//  JPMBManageAlertsLandingVC.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsLandingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [JPMBManageAlertsSectionData] = JPMBManageAlertsDataManager.getDataForManageAlertsLandingPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()

    }
    
    func internalSetup() -> Void {
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    //MARK: IBActions
    @IBAction func selectAccounts(_ sender: UITapGestureRecognizer) {
    
    }
}

extension JPMBManageAlertsLandingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].sectionData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = dataSource[indexPath.section].sectionData![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "manageAlertsCell", for: indexPath) as! JPMBManageAlertsCell
        cell.data = cellData
        return cell
    }
}

extension JPMBManageAlertsLandingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellData = dataSource[indexPath.section].sectionData![indexPath.row]
        let detailData = cellData.cellData
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "JPMBManageAlertsDetailVC") as! JPMBManageAlertsDetailVC
        self.navigationController?.pushViewController(controller, animated: true);
        
        controller.dataSource = detailData!
        
    }
}

