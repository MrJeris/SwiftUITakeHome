//
//  NetworkingManagerUserResponseSuccessMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Ruslan Magomedov on 02.08.2023.
//

import Foundation
@testable import iOSTakeHomeProject

class NetworkingManagerUserResponseSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: Endpoint) async throws {  }
    
}
