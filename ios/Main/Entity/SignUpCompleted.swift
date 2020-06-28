//
//  SignUpCompleted.swift
//  ios
//
//  Created by 이동연 on 10/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

internal struct SignUpCompleted{
    internal var code : Int!
    internal var message: String!
    internal var isSuccess: Bool!
}

extension SignUpCompleted: Mappable{
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        //tutorials <- map["result"]
    }
}
