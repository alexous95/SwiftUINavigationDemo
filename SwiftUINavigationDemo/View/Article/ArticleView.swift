//
//  ArticleView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 27/07/2022.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        List {
            ForEach(Article.examples) { article in
                NavigationLink(value: Destination.article(article)) {
                    ArticleListView(article: article)
                }
            }
        }
        .navigationTitle("Articles")
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
