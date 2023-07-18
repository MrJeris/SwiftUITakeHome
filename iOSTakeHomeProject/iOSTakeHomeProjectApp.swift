//
//  iOSTakeHomeProjectApp.swift
//  iOSTakeHomeProject
//
//  Created by Ruslan Magomedov on 18.07.2023.
//

import SwiftUI

@main
struct iOSTakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
            }
        }
    }
}
