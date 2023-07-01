//
//  ExampleRepoTargetType.swift
//  LXDevkitNetworkLayerExample
//
//  Created by Artak Gevorgyan on 01.07.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.
//

import Foundation

enum ExampleRepoTargetType: LXDevkitNetworkLayerTargetType {

    case searchArticles
    
    var baseURL: String {
        switch self {
        default:
            return API.BaseUrlStr
        }
    }
    
    var path: String {
        switch self {
        case .searchArticles:
            return "search?"
        }
    }
    
    var method: LXDevkitNetworkLayerHTTPMethod {
        switch self {
        case .searchArticles:
            return .get
        }
    }
    
    var task: LXDevkitNetworkLayerTask {
        switch self {
        case .searchArticles:
            return .requestParameters(parameters: ["api-key": API.APIKey,
                                                   "show-fields": "body,thumbnail,trailText,headline",
                                                   "show-tags": "all"])
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}
