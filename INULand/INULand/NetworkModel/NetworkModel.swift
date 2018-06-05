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
    
    private let profileURL = "https://playground-e61bc.firebaseapp.com/stu_status"
    var view : NetworkCallback
    
    init(_ view: NetworkCallback) {
        self.view = view
    }
    
    // 프로필 상태 가져오기
    func getProfile() {
        
        Alamofire.request(profileURL, method: .get, parameters: nil, headers: nil) .responseJSON { res in
            
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
    
    // 예약 취소 업데이트 하기
    func calcleReservation(param: String) {
        Alamofire.request("\(profileURL)?\(param)", method: .post, parameters: nil, headers: nil).responseJSON { res in
            switch res.result{
            case .success(let item):
                self.view.networkSuc(resultdata: item, code: "cancales")
                break
            case .failure(let error):
                print(error)
                self.view.networkFail(code: "cancle Error")
                break;
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
                    self.view.networkSuc(resultdata: item, code: "givesing")
                    break
                case .failure(let error):
                    print("error")
                    break
                }
        }
    }
}

