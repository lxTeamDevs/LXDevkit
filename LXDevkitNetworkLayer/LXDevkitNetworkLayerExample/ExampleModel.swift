//
//  ExampleModel.swift
//  LXDevkitNetworkLayerExample
//
//  Created by Artak Gevorgyan on 01.07.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.
//

import Foundation

struct ArticleInfoResponse: Codable {
    let articleInfo: ArticleInfo
    
    enum CodingKeys: String, CodingKey {
        case articleInfo = "response"
    }
}

struct ArticleInfo: Codable {
    let status: String
    let articleData: [ArticleData]
    
    enum CodingKeys: String, CodingKey {
        case articleData = "results"
        case status
    }
}

struct ArticleData: Codable {
    let details: ArticleDetails
    let tags: [Tag]
    let type: String
    let sectionName: String
    let webPublicationDate: String
    
    enum CodingKeys: String, CodingKey {
        case details = "fields"
        case tags
        case type
        case sectionName
        case webPublicationDate
    }
}

struct ArticleDetails: Codable {
    let headline: String
    let trailText: String
    let body: String
    let thumbnail: String
}

struct Tag: Codable {
    let webTitle: String
}
