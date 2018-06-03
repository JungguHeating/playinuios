//
//  SingingRoomViewController.swift
//  INULand
//
//  Created by Cho on 2018. 6. 3..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class SingingRoomViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var singCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewGradientShadow()
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = singCollectionView.dequeueReusableCell(withReuseIdentifier: "SingingRoomCollectionViewCell", for: indexPath) as! SingingRoomCollectionViewCell
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
        
        cell.roomOneButton.layer.cornerRadius = 5
        cell.roomTwoButton.layer.cornerRadius = 5
        return cell
    }
    
    
}

//Fuctions
extension SingingRoomViewController {
    
    func topViewGradientShadow() {
        
        let gradient = CAGradientLayer()
        
        gradient.frame = self.topView.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        gradient.colors = [UIColor.init(red: 80/255, green: 120/255, blue: 226/255, alpha: 1.0).cgColor, UIColor.init(red: 103/255, green: 145/255, blue: 228/255, alpha: 1.0).cgColor]
        
        self.topView.layer.insertSublayer(gradient, at: 0)
        
        self.topView.layer.shadowColor = UIColor.init(red: 196/255, green: 210/255, blue: 245/255, alpha: 1.0).cgColor
        self.topView.layer.shadowOpacity = 1
        self.topView.layer.shadowOffset = CGSize.zero
        self.topView.layer.shadowRadius = 10
    }
    
    func collectionViewInitialize() {
        self.singCollectionView.dataSource = self
        self.singCollectionView.delegate = self
        
        self.singCollectionView.register(UINib(nibName:"SingingRoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingingRoomCollectionViewCell")
    }
}
