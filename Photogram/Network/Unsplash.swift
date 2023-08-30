//
//  Unsplash.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/31.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Unsplash.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Unsplash: Codable {
    let total, totalPages: Int
    let results: [UnsplashResult]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct UnsplashResult: Codable {
    let urls: Urls
}
// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
