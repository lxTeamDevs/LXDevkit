//
//  LXDevkitNetworkLayerTargetType.swift
//  LXDevkitNetworkLayer
//
//  Created by Artak Gevorgyan on 01.07.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.
//

import Foundation
import Alamofire

enum LXDevkitNetworkLayerHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum LXDevkitNetworkLayerTask {
    
    case requestPlain
    
    case requestParameters(parameters: [String: Any],
                           encoding: ParameterEncoding = JSONEncoding.default)
}

protocol LXDevkitNetworkLayerTargetType {

    var baseURL: String {get}

    var path: String {get}
    
    var method: LXDevkitNetworkLayerHTTPMethod {get}
    
    var task: LXDevkitNetworkLayerTask {get}
    
    var headers: [String: String]? {get}
}
