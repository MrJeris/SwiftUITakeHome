//
//  CreateViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 22.07.2023.
//

import Foundation

final class CreateViewModel: ObservableObject {
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    @Published private(set) var error: FormError?
    @Published var hasError = false
    
    private let networkingManager: NetworkingManagerImpl!
    private let validator: CreateValidatorImpl!
    
    init(networkingManager: NetworkingManagerImpl = NetworkingManager.shared,
         validator: CreateValidatorImpl = CreateValidator()) {
        self.networkingManager = networkingManager
        self.validator = validator
    }
    
    @MainActor
    func create() async {
        do {
            try validator.validate(person)
            
            state = .submitting
            
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let data = try encoder.encode(person)
            
            try await networkingManager.request(session: .shared, .create(submissionData: data))
            
            state = .successful
            
        } catch {
            self.hasError = true
            self.state = .unsuccessful
            
            switch error {
            case is NetworkingManager.NetworkingError:
                self.error = .networking(error: error as! NetworkingManager.NetworkingError)
            case is CreateValidator.CreateValidatorError:
                self.error = .validation(error: error as! CreateValidator.CreateValidatorError)
            default:
                self.error = .systemError(error: error)
            }
        }
    }
}

extension CreateViewModel {
    enum SubmissionState {
        case unsuccessful
        case successful
        case submitting
    }
}

extension CreateViewModel {
    enum FormError: LocalizedError {
        case networking(error: LocalizedError)
        case validation(error: LocalizedError)
        case systemError(error: Error)
    }
}
extension CreateViewModel.FormError {
    var errorDescription: String? {
        switch self {
        case .networking(let error), .validation(let error):
            return error.errorDescription
        case.systemError(let error):
            return error.localizedDescription
        }
    }
}

extension CreateViewModel.FormError: Equatable {
    static func == (lhs: CreateViewModel.FormError, rhs: CreateViewModel.FormError) -> Bool {
        switch (lhs, rhs) {
        case (.networking(let lhsType), .networking(let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        case (.validation(let lhsType), .validation(let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        case (.systemError(let lhsType), .networking(let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        default:
            return false
        }
    }
}
