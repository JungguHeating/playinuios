//
//  RentViewController.swift
//  INULand
//
//  Created by 김진우 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class RentViewController: UIViewController {

    @IBOutlet weak var rentCollectionView: UICollectionView!
    @IBOutlet weak var topImage: UIImageView!
    
    let rentStuff = ["1인용 자전거", "2인용 자전거", "인라인 스케이트"]
    
    
    
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

extension RentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rentCollectionView.dequeueReusableCell(withReuseIdentifier: "RentCollectionViewCell", for: indexPath) as! RentCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
        
        cell.view.layer.cornerRadius = 5
        cell.view.layer.borderWidth = 1.0
        cell.view.layer.borderColor = UIColor.clear.cgColor
        cell.view.layer.masksToBounds = true
        
        /*cell.view.layer.shadowColor = UIColor.lightGray.cgColor
        cell.view.layer.shadowRadius = 1.5
        cell.view.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.view.layer.shadowOpacity = 0.4
        cell.view.layer.masksToBounds = false
        cell.view.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
        */
       
        cell.stuffLabel.text = rentStuff[indexPath.row]
        
        return cell
        
            
        
    }
}
extension RentViewController{
    func collectionViewInitialize(){
        self.rentCollectionView.dataSource = self
        self.rentCollectionView.delegate = self
        
        self.rentCollectionView.register(UINib(nibName:"RentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RentCollectionViewCell")
        
    }
}
