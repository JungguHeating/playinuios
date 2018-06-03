//
//  ProfileViewController.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewInitialize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 1 {
            let noShowCell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileNoShowCollectionViewCell", for: indexPath) as! ProfileNoShowCollectionViewCell
            
            return noShowCell

        }else{
            let noShowCell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileNoShowCollectionViewCell", for: indexPath) as! ProfileNoShowCollectionViewCell
            
            return noShowCell

        }
    }
}


extension ProfileViewController {
    func collectionViewInitialize() {
        self.profileCollectionView.dataSource = self
        self.profileCollectionView.delegate = self
        
        self.profileCollectionView.register(UINib(nibName:"ProfileNoShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileNoShowCollectionViewCell")
        
    }
}
