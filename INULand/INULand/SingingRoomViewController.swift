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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImage.image = UIImage(named: "group")
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
        return 9
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
        cell.roomOneButton.clipsToBounds = true
        cell.roomTwoButton.layer.cornerRadius = 5
        cell.roomTwoButton.clipsToBounds = true
        
        let cellGradient = CAGradientLayer()
        
        cellGradient.frame = cell.roomOneButton.bounds
        cellGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        cell.roomOneButton.layer.insertSublayer(cellGradient, at: 0)
        
        return cell
    }
    
    
}

//Fuctions
extension SingingRoomViewController {
    func collectionViewInitialize() {
        self.singCollectionView.dataSource = self
        self.singCollectionView.delegate = self
        
        self.singCollectionView.register(UINib(nibName:"SingingRoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SingingRoomCollectionViewCell")
    }
}
