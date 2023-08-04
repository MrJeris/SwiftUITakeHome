//
//  DetailViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 21.07.2023.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    @Published private(set) var isLoading = false
    
    private let networkingManager: NetworkingManagerImpl!
    
    init(networkingManager: NetworkingManagerImpl = NetworkingManager.shared) {
        self.networkingManager = networkingManager
    }
    
    @MainActor
    func fetchDetails(for id: Int) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            self.userInfo = try await networkingManager.request(session: .shared, .detail(id: id), type: UserDetailResponse.self)
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}
