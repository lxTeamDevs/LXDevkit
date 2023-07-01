//
//  ExampleRepo.swift
//  LXDevkitNetworkLayerExample
//
//  Created by Artak Gevorgyan on 01.07.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.
//

import Foundation
import Alamofire

struct API {
    static let APIKey = "78c4713e-80f2-4062-921c-479dbc432f19"
    static let BaseUrlStr = "https://content.guardianapis.com/"
}

class ExampleRepo: LXDevkitNetworkLayerBaseRepository<ExampleRepoTargetType> {
    
    func fetchArticles(completionHandler: @escaping (ArticleInfoResponse?, Error?) -> Void) {
        return fetchData(target: .searchArticles,
                         responseClass: ArticleInfoResponse.self) { (result) in
            switch result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                completionHandler(nil, nil)
            }
        }
    }
}
