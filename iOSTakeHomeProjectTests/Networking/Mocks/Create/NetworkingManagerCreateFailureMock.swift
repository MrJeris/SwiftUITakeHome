//
//  NetworkingManagerCreateFailureMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Ruslan Magomedov on 04.08.2023.
//

import Foundation
@testable import iOSTakeHomeProject

class NetworkingManagerCreateFailureMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return Data() as! T
    }
    
    func request(session: URLSession, _ endpoint: iOSTakeHomeProject.Endpoint) async throws {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
}
