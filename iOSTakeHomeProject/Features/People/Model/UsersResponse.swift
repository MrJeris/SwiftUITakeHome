//
//  UsersResponse.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 20.07.2023.
//

import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
