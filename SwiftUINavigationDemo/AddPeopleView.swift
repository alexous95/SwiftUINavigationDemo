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

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navigationRouter: NavigationRouter
    var personViewModel: PersonViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TextField("Name", text: $newName)
                .textFieldStyle(.roundedBorder)
            TextField("Age", text: $newAge)
                .textFieldStyle(.roundedBorder)

            Button("Add") {
                personViewModel.addPerson(name: newName, age: Int(newAge) ?? 0)
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