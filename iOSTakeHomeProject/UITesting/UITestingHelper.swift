//
//  UITestingHelper.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 07.08.2023.
//

#if DEBUG

import Foundation

struct UITestingHelper {
    
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    static var isNetworkingSuccessful: Bool {
        ProcessInfo.processInfo.environment["-networking-success"] == "1"
    }
}

#endif