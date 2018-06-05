//
//  ProfileViewController.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var reservationCellView: UIView!
    @IBOutlet weak var noShowCellView: UIView!
    
    @IBOutlet weak var reservationLocationLabel: UILabel!
    @IBOutlet weak var reservationTimeLabel: UILabel!
    @IBOutlet weak var noReservationLabel: UILabel!
    @IBOutlet weak var reservationCancelButton: UIButton!
    @IBOutlet weak var divisionLine: UIView!
    
    @IBOutlet weak var noShowCountLabel: UILabel!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileId: UILabel!
    
    
    var profileInfo:userinfo?
    var profileIdString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = self.appDelegate.profileInfo?.userName
        profileIdString = "\(self.appDelegate.profileInfo?.userId!)"
        profileId.text = profileIdString
        
        collectionViewInitialize()
        isReservedCheck()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reservationCancleClicked(_ sender: Any) {
        
        
    }
    
    func isReservedCheck() {
        
        switch self.appDelegate.profileInfo?.reserved {
        case 0:  // 예약 없음
            reservationLocationLabel.text = nil
            reservationTimeLabel.text = nil
            reservationCancelButton.isHidden = true
            divisionLine.isHidden = true
            break
        case 1: // 노래방 예약
            reservationLocationLabel.text = "노래방"
            reservationTimeLabel.text = self.appDelegate.profileInfo?.resTime
            reservationCancelButton.isHidden = false
            divisionLine.isHidden = false
            noReservationLabel.text = nil
            break
        case 2: // 플스방 예약
            reservationLocationLabel.text = "플스방"
            reservationTimeLabel.text = self.appDelegate.profileInfo?.resTime
            reservationCancelButton.isHidden = false
            divisionLine.isHidden = false
            noReservationLabel.text = nil
            break
        default:
            break
        }
    
        
    }
    
    func collectionViewInitialize(){
        reservationCellView.layer.borderWidth = 1.0
        reservationCellView.layer.cornerRadius = 5
        reservationCellView.layer.borderColor = UIColor.clear.cgColor
        reservationCellView.layer.masksToBounds = true;
        
        reservationCellView.layer.shadowColor = UIColor.lightGray.cgColor
        reservationCellView.layer.shadowRadius = 1.5
        reservationCellView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        reservationCellView.layer.shadowOpacity = 0.4
        reservationCellView.layer.masksToBounds = false
        reservationCellView.layer.shadowPath = UIBezierPath(roundedRect: reservationCellView.bounds, cornerRadius: 5).cgPath
        
        noShowCellView.layer.borderWidth = 1.0
        noShowCellView.layer.cornerRadius = 5
        noShowCellView.layer.borderColor = UIColor.clear.cgColor
        noShowCellView.layer.masksToBounds = true;
        
        noShowCellView.layer.shadowColor = UIColor.lightGray.cgColor
        noShowCellView.layer.shadowRadius = 1.5
        noShowCellView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        noShowCellView.layer.shadowOpacity = 0.4
        noShowCellView.layer.masksToBounds = false
        noShowCellView.layer.shadowPath = UIBezierPath(roundedRect: noShowCellView.bounds, cornerRadius: 5).cgPath
    }
}



