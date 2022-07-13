//
//  Person.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID()

    let name: String
    let age: Int
    let adress: String
}

extension Person {
    static let examples: [Person] = [
        .init(name: "Goncalves Alexandre", age: 27, adress: "Champs Elysées"),
        .init(name: "Goncalves Nathan", age: 24, adress: "Matignon")
    ]
}
