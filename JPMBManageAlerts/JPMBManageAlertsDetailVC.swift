//
//  JPMBManageAlertsDetailVC.swift
//  JPMBManageAlerts
//
//  Created by Durgesh Lal Gupta on 1/20/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class JPMBManageAlertsDetailVC: UIViewController {

    var currentIndex: Int = 0 {
        didSet{
             counterLabel.text = "\(currentIndex + 1) of \(dataSource.count)"
        }
    }
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    var dataSource: [JPMBManageAlertsDetailData] = [JPMBManageAlertsDetailData](){
        didSet{
            if let collectionView = collectionView {
                collectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Current Index \(currentIndex)")
        
        if currentIndex == 0 {
            previousButton.isEnabled = false
            nextButton.isEnabled = true
        } else if (currentIndex == dataSource.count - 1) {
            self.nextButton.isEnabled = false
            self.previousButton.isEnabled = true
        } else {
            self.previousButton.isEnabled = true
            self.nextButton.isEnabled = true
        }
    }
    
    func internalSetup() -> Void {
        counterLabel.text = "1 of \(dataSource.count)"
        previousButton.isEnabled = false
    }
    
    //MARK: IBAction
    @IBAction func previousClicked(_ sender: UIButton) {
        let indexPath = NSIndexPath.init(row: currentIndex - 1, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: .right, animated: true)
        currentIndex = currentIndex - 1
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        let indexPath = NSIndexPath.init(row: currentIndex + 1, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: .right, animated: true)
        currentIndex = currentIndex + 1
    }
    
}


extension JPMBManageAlertsDetailVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint)!
        currentIndex = visibleIndexPath.row
    }
}


extension JPMBManageAlertsDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = dataSource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "manageAlertsDetailCell", for: indexPath) as! JPMBManageAlertsDetailCell
        cell.data = data
        return cell
    }
}


extension JPMBManageAlertsDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.size.width, height: self.collectionView.bounds.size.height)
    }
}








