//
//  PersonViewModel.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import Foundation
import SwiftUI

class PersonViewModel: ObservableObject {

    @Published private(set) var persons: [Person] = []

    func loadPersons() {
        persons = Person.examples
    }

    func addPerson(name: String, age: Int, adress: String) {
        let newPerson = Person(name: name, age: age, adress: adress)
        persons.append(newPerson)
    }

    func getLastPerson() -> Person {
        return persons.last ?? Person(name: "Error", age: 0, adress: "Error")
    }
}
