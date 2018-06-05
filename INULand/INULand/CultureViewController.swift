//
//  CultureViewController.swift
//  INULand
//
//  Created by 김진우 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class CultureViewController: UIViewController {

    @IBOutlet weak var topImage: UIImageView!
    
    // MARK: - Examples
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImage.image = UIImage(named: "group")
   
        // Control 5: Adding custom subview to Indicator
        let indicatorControl = BetterSegmentedControl(
            frame: CGRect(x: 0.0, y: 72.0, width: view.bounds.width, height: 57.0),
            titles: ["방 개수", "DVD목록"],
            index: 0, options: [.backgroundColor(.white),
                                .titleColor(.lightGray),
                                .indicatorViewBorderColor(.lightGray),
                                .selectedTitleColor(UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)),
                                .bouncesOnChange(false),
                                .panningDisabled(false)])
        indicatorControl.autoresizingMask = [.flexibleWidth]
        let customSubview = UIView(frame: CGRect(x: 0, y: 45, width: 207, height: 4.0))
        customSubview.backgroundColor = UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)
        customSubview.layer.cornerRadius = 2.0
        customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        indicatorControl.addSubviewToIndicator(customSubview)
        view.addSubview(indicatorControl)
    }
    
    // MARK: - Action handlers
    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            print("Turning lights on.")
            view.backgroundColor = .white
        }
        else {
            print("Turning lights off.")
            view.backgroundColor = .darkGray
        }
    }
    
    /*@IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index) and the title is \(sender.titles[Int(sender.index)])")
    }*/

}
