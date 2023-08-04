//
//  UserDetailResponse.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 20.07.2023.
//

import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable, Equatable {
    let data: User
    let support: Support
}

