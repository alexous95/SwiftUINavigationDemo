//
//  SwiftUINavigationDemoApp.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

@main
struct SwiftUINavigationDemoApp: App {
    @ObservedObject var navigationRouter = MainNavigationRouter()

    var body: some Scene {
        WindowGroup {
            navigationRouter.displayHomeView()
                .environmentObject(navigationRouter)
        }
    }
}
