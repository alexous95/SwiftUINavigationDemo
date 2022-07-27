//
//  ContentView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

enum Destination: Hashable {
    case article(Article)
    case person(Person)
}

struct ContentView: View {

    @State private var selection: Panel? = Panel.article
    @EnvironmentObject var navigationRouter: MainNavigationRouter

    init() {
        UINavigationBar.appearance().tintColor = .label
    }

    var body: some View {
        NavigationSplitView {
            SideBar(selection: $selection)
        } detail: {
            NavigationStack(path: $navigationRouter.navigationPath) {
                DetailColumn(selection: $selection)
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .article(let article):
                    navigationRouter.displayDetailArticleView(article: article)

                case .person(let person):
                    navigationRouter.displayDetailPersonView(person: person)
                }
            }
        }
        .onChange(of: selection) { _ in
            navigationRouter.removeLastPath()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MainNavigationRouter())
    }
}
