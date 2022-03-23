//
//  Model.swift
//  AuthenticationPractice
//
//  Created by 이태현 on 2022/03/23.
//


import Foundation

// MARK: - Welcome
struct Model: Codable, Hashable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct Datum: Codable, Hashable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable, Hashable {
    let url: String
    let text: String
}
