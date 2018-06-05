//
//  Contact.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

class userinfo {
    var noShow: Int?
    var userName: String?
    var userId: Int?
    var reserved: Int?
    var resTime: String?
    
    init(Kind_num: Int, Stu_id: Int, Stu_Noshow: Int, Stu_name: String, resTime: String){
        self.noShow = Stu_Noshow
        self.userName = Stu_name
        self.userId = Stu_id
        self.reserved = Kind_num
        self.resTime = resTime
    }
    
}

//class SingingRoom {
//    var roomNum: String?
//    var isReserved: Int?
//
//    init(num: String, isReserved: Int) {
//        self.roomNum = num
//        self.isReserved = isReserved
//    }
//}

//{"Kind_num":1,"Stu_id":201301484,"Stu_Noshow":1,"Stu_name":"임동완"}

//https://playground-e61bc.firebaseapp.com/stu_status
