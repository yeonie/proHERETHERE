//
//  LoginResponse.swift
//  ios
//
//  Created by 이동연 on 08/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct LoginResponse {
    var code: Int!
    var message: String!
    var isSuccess: Bool!
    //var tutorials: [Tutorial?]!
}

extension LoginResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["success"]
        //tutorials <- map["result"]
    }
    
}
