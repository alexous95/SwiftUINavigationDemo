//
//  SwiftUINavigationDemoApp.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

@main
struct SwiftUINavigationDemoApp: App {
    @ObservedObject var navigationRouter = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationRouter)
        }
    }
}
