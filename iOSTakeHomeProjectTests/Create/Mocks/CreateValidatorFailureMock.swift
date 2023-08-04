//
//  CreateValidatorFailureMock.swift
//  iOSTakeHomeProjectTests
//
//  Created by Ruslan Magomedov on 04.08.2023.
//

import Foundation
@testable import iOSTakeHomeProject

struct CreateValidatorFailureMock: CreateValidatorImpl {
    func validate(_ person: iOSTakeHomeProject.NewPerson) throws {
        throw CreateValidator.CreateValidatorError.invalidFirstName
    }
}
