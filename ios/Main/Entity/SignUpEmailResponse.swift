//
//  SignUpEmailResponse.swift
//  ios
//
//  Created by 이동연 on 10/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct SignUpEmailResponse {
    var reqType: Int!
    var code: Int!
    var message: String!
    var success: Bool!
    //var tutorials: [Tutorial?]!
}

extension SignUpEmailResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        reqType <- map["reqType"]
        message <- map["message"]
        success <- map["success"]
        //tutorials <- map["result"]
    }
    
}
