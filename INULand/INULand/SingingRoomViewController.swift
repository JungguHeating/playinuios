//
//  SingingRoomViewController.swift
//  INULand
//
//  Created by Cho on 2018. 6. 3..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class SingingRoomViewController: UIViewController {
    
    @IBOutlet weak var singCollectionView: UICollectionView!
    @IBOutlet weak var topImage: UIImageView!
    
    var isSuccess: Bool = false
    var rooms: [SingingRoom] = [] {
        didSet {
            if self.singCollectionView != nil {
                self.singCollectionView.reloadData()
            }
        }
    }
    
    let times: [String] = ["09", "10", "11", "12", "13", "14", "15", "16"]
    let status: [String] = ["예약불가", "예약가능"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImage.image = UIImage(named: "group")
        let model = NetworkModel(self)
        model.getSingingRoom()
        collectionViewInitialize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//CollectionView
extension SingingRoomViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = singCollectionView.dequeueReusableCell(withReuseIdentifier: "SingingRoomCollectionCell", for: indexPath) as! SingingRoomCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
        
        cell.timeLabel.text = times[indexPath.row] + ":00"
        
        cell.roomOneButton.layer.cornerRadius = 5
        cell.roomOneButton.clipsToBounds = true
        cell.roomTwoButton.layer.cornerRadius = 5
        cell.roomTwoButton.clipsToBounds = true
        
        cell.roomOneButton.tag = indexPath.row
        cell.roomTwoButton.tag = indexPath.row
        
        cell.roomOneButton.addTarget(self, action: #selector(roomOneClicked(sender:)), for: .touchUpInside)
        cell.roomTwoButton.addTarget(self, action: #selector(roomTwoClicked(sender:)), for: .touchUpInside)
        
        let cellOneGradient = CAGradientLayer()
        
        cellOneGradient.frame = cell.roomOneButton.bounds
        cellOneGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellOneGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellOneGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        let cellTwoGradient = CAGradientLayer()
        
        cellTwoGradient.frame = cell.roomOneButton.bounds
        cellTwoGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellTwoGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellTwoGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        if isSuccess {
            if rooms[indexPath.row].isReserved == 0 {
                cell.roomOneLabel.text = status[0]
                cell.roomOneButton.isEnabled = false
                print(status[0])
            }
            else if rooms[indexPath.row].isReserved == 1 {
                cell.roomOneButton.layer.insertSublayer(cellOneGradient, at: 1)
                cell.roomOneButton.isEnabled = true
                cell.roomOneLabel.text = status[1]
            }
            if rooms[indexPath.row + 8].isReserved == 0 {
                cell.roomTwoLabel.text = status[0]
                cell.roomTwoButton.isEnabled = false
            }
            else if rooms[indexPath.row + 8].isReserved == 1 {
                cell.roomTwoButton.layer.insertSublayer(cellTwoGradient, at: 1)
                cell.roomTwoButton.isEnabled = true
                cell.roomTwoLabel.text = status[1]
            }
        }
        
        return cell
    }
    
    
}

//Network
extension SingingRoomViewController: NetworkCallback {
    func networkSuc(resultdata: Any, code: String) {
        if code == "sing" {
            print(resultdata)
            var temp: [SingingRoom] = []
            if let items = resultdata as? [NSDictionary] {
                for item in items {
                    let num = item["name"] as? String ?? ""
                    let isReserved = item["reserved"] as? Int ?? 3
                    //                    var num = 1
                    //                    let isReserved = item["\(num)"] as? Int ?? 3
                    
                    let obj = SingingRoom.init(num: num, isReserved: isReserved)
                    //                    num += 1
                    temp.append(obj)
                }
            }
            self.rooms = temp
            print(self.rooms.count)
            self.isSuccess = true
        }
        else if code == "givesing" {
            self.rooms.removeAll()
            self.isSuccess = false
            let model = NetworkModel(self)
            model.getSingingRoom()
        }
    }
    
    func networkFail(code: String) {
        if code == "sing" {
            print("실패하였습니다.")
        }
    }
}

//Fuctions
extension SingingRoomViewController {
    func collectionViewInitialize() {
        self.singCollectionView.dataSource = self
        self.singCollectionView.delegate = self
        self.singCollectionView.register(UINib(nibName:"SingingRoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingingRoomCollectionCell")
    }
    
    @objc func roomOneClicked(sender: UIButton) {
        let param = "stdId=201301484&roomNum=\(rooms[sender.tag].roomNum!)&roomTime=\(times[sender.tag])00&resTime=\(times[sender.tag]):00"
        let cell = singCollectionView.cellForItem(at: [0,sender.tag]) as! SingingRoomCollectionViewCell
        cell.roomOneButton.layer.sublayers?.removeAll()
        cell.roomOneLabel.text = status[0]
        cell.roomOneButton.isEnabled = false
        let model = NetworkModel(self)
        model.giveSingingRoom(param: param)
    }
    
    @objc func roomTwoClicked(sender: UIButton) {
        let param = "stdId=201301484&roomNum=\(rooms[sender.tag + 8].roomNum!)&roomTime=\(times[sender.tag])00&resTime=\(times[sender.tag]):00"
        let cell = singCollectionView.cellForItem(at: [0,sender.tag]) as! SingingRoomCollectionViewCell
        cell.roomTwoButton.layer.sublayers?.removeAll()
        cell.roomTwoLabel.text = status[0]
        cell.roomTwoButton.isEnabled = false
        let model = NetworkModel(self)
        model.giveSingingRoom(param: param)
    }
}
