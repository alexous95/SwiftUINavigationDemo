//
//  GenericListView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 13/07/2022.
//

import SwiftUI

struct ArticleListView: View {
    var article: Article

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(systemName: "book.fill")
                    .resizable()
                    .frame(width: 20.0, height: 20.0)
                Text(article.title)
            }

            Text(article.author)
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(article: Article(title: "Test", author: "Test"))
    }
}
