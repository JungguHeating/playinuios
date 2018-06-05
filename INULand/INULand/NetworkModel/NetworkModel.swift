//
//  NetworkModel.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

import Alamofire
import UIKit

class NetworkModel{
    var view : NetworkCallback
    
    init(_ view: NetworkCallback) {
        self.view = view
    }
    
// 프로필 상태 가져오기
    func getProfile() {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/stu_status")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil) .responseJSON { res in
            
            switch res.result{
            case .success(let item):
                self.view.networkSuc(resultdata: item, code: "Profile")
                break
            case .failure(let error):
                print(error)
                self.view.networkFail(code: "error")
            }
        }
    }
}

