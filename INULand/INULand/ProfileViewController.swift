//
//  ProfileViewController.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var reservationCellView: UIView!
    @IBOutlet weak var noShowCellView: UIView!
    
    @IBOutlet weak var reservationLocationLabel: UILabel!
    @IBOutlet weak var reservationTimeLabel: UILabel!
    @IBOutlet weak var noReservationLabel: UILabel!
    @IBOutlet weak var reservationCancelButton: UIButton!
    @IBOutlet weak var divisionLine: UIView!
    
    @IBOutlet weak var noShowCountLabel: UILabel!
    
    var profileInfo:[userinfo] = []
    var isReserved:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewInitialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        let model = NetworkModel(self)
        model.getProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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


extension ProfileViewController : NetworkCallback {
    
    func networkSuc(resultdata: Any, code: String) {
        if code == "Profile" {
            print(resultdata)
            var temp : [userinfo] = []
            if let item = resultdata as? [NSDictionary] {
                for jsonitem in item{
                    let noShow = jsonitem["Stu_Noshow"] as? Int ?? 0
                    let userName = jsonitem["Stu_name"] as? String ?? ""
                    let userId = jsonitem["Stu_id"] as? Int ?? 0
                    let reserved = jsonitem["Kind_num"] as? Int ?? 0
                    
                    let obj = userinfo(Kind_num: reserved, Stu_id: userId, Stu_Noshow: noShow, Stu_name: userName)
                    temp.append(obj)
                    print("dd")
                    
                }
                self.profileInfo = temp
            }
        }
    }
    func networkFail(code: String) {
        if(code == "error") {
            print("실패하였습니다.")
            
        }
    }
    
}
