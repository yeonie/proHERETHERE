//
//  InterestedRegionResponse.swift
//  ios
//
//  Created by 이동연 on 10/05/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct InterestedRegionResponse {
    var code: Int!
    var message: String!
    var isSuccess: Bool!
    //var tutorials: [Tutorial?]!
}

extension InterestedRegionResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        isSuccess <- map["isSuccess"]
        //tutorials <- map["result"]
    }
    
}
