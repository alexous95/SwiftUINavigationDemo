//
//  DetailColumn.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 27/07/2022.
//

import SwiftUI

struct DetailColumn: View {
    /// The person's selection in the sidebar.
    ///
    /// This value is a binding, and the superview must pass in its value.
    @Binding var selection: Panel?
    var body: some View {
        switch selection ?? .article {
        case .article:
            ArticleView()

        case .persons:
            PersonView()
        default:
            Text("details")
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selection: Panel? = .article

        var body: some View {
            DetailColumn(selection: $selection)
        }
    }
    static var previews: some View {
        Preview()
    }
}
