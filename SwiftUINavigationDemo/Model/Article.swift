//
//  Article.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import Foundation

struct Article: Hashable, Identifiable {
    let id = UUID()

    let title: String
    let author: String
}

extension Article {
    static let examples: [Article] = [
        .init(title: "Le monde en crise", author: "John Doe"),
        .init(title: "Une solution ?", author: "Everybody"),
        .init(title: "Je peux pas j'ai piscine", author: "Me")
        ]
}
