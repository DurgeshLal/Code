//
//  JPMBManageAlertsDataModel.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsSectionData: NSObject {
    var sectionTitle: String?
    var sectionData: [JPMBManageAlertsCellData]?
    
    init(sectionTitle: String?, sectionData: [JPMBManageAlertsCellData]?) {
        self.sectionTitle = sectionTitle
        self.sectionData = sectionData
    }
}

class JPMBManageAlertsCellData: NSObject {
    var cellTitle: String?
    var cellData: [JPMBManageAlertsDetailData]?
    
    init(cellTitle: String?, cellData: [JPMBManageAlertsDetailData]?) {
        self.cellTitle = cellTitle
        self.cellData = cellData
    }
}

class JPMBManageAlertsDetailData: NSObject {
    var cellDetailIdentifier: String?
    var cellDetailData: [JPMBManageAlertsDetailCellData]?
    
    init(cellDetailIdentifier: String?, cellDetailData:  [JPMBManageAlertsDetailCellData]?) {
        self.cellDetailIdentifier = cellDetailIdentifier
        self.cellDetailData = cellDetailData
    }
}

class JPMBManageAlertsDetailCellData: NSObject {
    var cellDetailIdentifier: String?
    var cellDetailTitle: String?
    var cellDetailDescription: String?
    var cellDetailState: Bool?
    
    init(cellDetailIdentifier: String?, cellDetailTitle: String?, cellDetailDescription: String?, cellDetailState: Bool?) {
        self.cellDetailIdentifier = cellDetailIdentifier
        self.cellDetailTitle = cellDetailTitle
        self.cellDetailDescription = cellDetailDescription
        self.cellDetailState = cellDetailState
    }
}


struct JPMBManageAlertsDataManager {
    
    static func getDataForManageAlertsLandingPage() -> [JPMBManageAlertsSectionData] {
        var dataSource: [JPMBManageAlertsSectionData] = [JPMBManageAlertsSectionData]()
        
        for index in 1...2 {
            var sectionArray: [JPMBManageAlertsCellData] = [JPMBManageAlertsCellData]()
            for sectionIndex in 1...4 {
                
                var sectionDetailArray: [JPMBManageAlertsDetailData] = [JPMBManageAlertsDetailData]()
                for sectionDetailIndex in 1...4 {
                    
                    var sectionDetailDataArray: [JPMBManageAlertsDetailCellData] = [JPMBManageAlertsDetailCellData]()
                    for sectionDetailDataIndex in 1...3 {
                        let object = JPMBManageAlertsDetailCellData.init(cellDetailIdentifier: "Detail Cell Identifier \(sectionDetailDataIndex)", cellDetailTitle: "Title \(sectionDetailDataIndex)", cellDetailDescription: "Description \(sectionDetailDataIndex)", cellDetailState: true)
                        sectionDetailDataArray.append(object)
                    }
                    
                    let object = JPMBManageAlertsDetailData.init(cellDetailIdentifier: "Identifier \(sectionDetailIndex)", cellDetailData: sectionDetailDataArray)
                    sectionDetailArray.append(object)
                }
                
                let object = JPMBManageAlertsCellData.init(cellTitle: "CellTitle \(sectionIndex)", cellData: sectionDetailArray)
                sectionArray.append(object)
            }
            
            let object = JPMBManageAlertsSectionData.init(sectionTitle: "Section Title \(index)", sectionData: sectionArray)
            dataSource.append(object)
            
        }
        return dataSource
    }
}




