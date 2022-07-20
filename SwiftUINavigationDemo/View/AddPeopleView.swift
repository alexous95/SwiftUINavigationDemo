//
//  AddPeopleView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

struct AddPeopleView: View {
    @State private var newName: String = ""
    @State private var newAge: String = ""
    @State private var newAdress: String = ""

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navigationRouter: MainNavigationRouter
    var personViewModel: PersonViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TextField("Name", text: $newName)
                .textFieldStyle(.roundedBorder)
            TextField("Age", text: $newAge)
                .textFieldStyle(.roundedBorder)
            TextField("Adress", text: $newAdress)
                .textFieldStyle(.roundedBorder)

            Button("Add") {
                personViewModel.addPerson(name: newName, age: Int(newAge) ?? 0, adress: newAdress)

                let person = Person(name: newName, age: Int(newAge) ?? 0, adress: newAdress)
                // On ajoute a la main la vue que l'on veut dans le path
                navigationRouter.addToPath(path: Destination.person(person))
                dismiss.callAsFunction()
            }
        }
    }
}

struct AddPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleView(personViewModel: PersonViewModel())
    }
}
