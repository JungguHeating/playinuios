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
    // 노래방 정보 만들어오기
    func getSingingRoom() {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/kara")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    self.view.networkSuc(resultdata: item, code: "sing")
                    break
                case .failure(let error):
                    self.view.networkFail(code: "sing")
                    print(error)
                    break
                }
        }
    }
    // 노래방 정보 업데이트 하기
    func giveSingingRoom(param: String) {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/kara?\(param)")
        print(url)
        Alamofire.request(url!, method: .post, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    print("success")
                    if let tf = item as? Bool {
                        if tf {
                            self.view.networkSuc(resultdata: item, code: "reservationSuccess")
                        }
                        else {
                            self.view.networkSuc(resultdata: item, code: "reservationFail")
                        }
                    }
                    break
                case .failure(let error):
                    print("error")
                    self.view.networkFail(code: "givesing")
                    break
                }
        }
    }
}

