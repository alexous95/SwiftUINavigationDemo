//
//  PersonView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 27/07/2022.
//

import SwiftUI

struct PersonView: View {
    @StateObject private var personViewModel = PersonViewModel()
    @State private var showingPeopleSheet = false

    var body: some View {
        List {
            ForEach(personViewModel.persons) { person in
                NavigationLink(value: Destination.person(person)) {
                    PersonListView(person: person)
                }
            }
            Button("Load people") {
                personViewModel.loadPersons()
            }
            Button("Add people") {
                showingPeopleSheet.toggle()
            }
            .sheet(isPresented: $showingPeopleSheet){
                AddPeopleView(personViewModel: personViewModel)
            }
        }
        .navigationTitle("Persons")
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
