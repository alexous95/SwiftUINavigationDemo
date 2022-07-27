//
//  SideBar.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 27/07/2022.
//

import SwiftUI

enum Panel: Hashable {
    case article
    case persons
    case charts
    case editor
}

struct SideBar: View {
    @Binding var selection: Panel?
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(value: Panel.article) {
                Label("Articles", systemImage: "book")
            }
            NavigationLink(value: Panel.persons) {
                Label("Persons", systemImage: "person.2")
            }
            NavigationLink(value: Panel.charts) {
                Label("Charts", systemImage: "chart.bar")
            }

            Section("Other section") {
                NavigationLink(value: Panel.editor) {
                    Label("Editor", systemImage: "slider.horizontal.3")
                }
            }
        }
        .navigationTitle("Nav Demo")
        #if os(macOS)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
    }
}

struct SideBar_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selection: Panel? = .article
        var body: some View {
            SideBar(selection: $selection)
        }
    }

    static var previews: some View {
        NavigationSplitView {
            Preview()
        } detail: {
            Text("Detail!")
        }
    }
}
