//
//  NewsListResponse.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import Foundation

// MARK: - NewsListResponse
struct NewsListResponse: Codable {
    let status: String
    let articles: [Article]
    let totalResults: Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? DocumentDefaultValues.Empty.string
        articles = try values.decodeIfPresent([Article].self, forKey: .articles) ?? []
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults) ?? DocumentDefaultValues.Empty.int
    }
}

// MARK: - Article
struct Article: Codable {
    let author: String
    let urlToImage: String
    let title: String
    let articleDescription: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author, urlToImage, title
        case articleDescription = "description"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author) ?? DocumentDefaultValues.Empty.string
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage) ?? DocumentDefaultValues.Empty.string
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? DocumentDefaultValues.Empty.string
        articleDescription = try values.decodeIfPresent(String.self, forKey: .articleDescription) ?? DocumentDefaultValues.Empty.string
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? DocumentDefaultValues.Empty.string
    }
    
    init() {
        self.author = DocumentDefaultValues.Empty.string
        self.urlToImage = DocumentDefaultValues.Empty.string
        self.title = DocumentDefaultValues.Empty.string
        self.articleDescription = DocumentDefaultValues.Empty.string
        self.url = DocumentDefaultValues.Empty.string
    }
}
