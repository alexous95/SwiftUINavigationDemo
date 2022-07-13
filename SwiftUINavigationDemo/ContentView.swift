//
//  ContentView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

struct ContentView: View {

    enum Destination: Hashable {
        case article(Article)
        case person(Person)
    }

    @State private var showingPeopleSheet = false
    @StateObject private var personViewModel = PersonViewModel()
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
        NavigationStack(path: $navigationRouter.navigationPath) {
            List {
                Section("Article") {
                    ForEach(Article.examples) { article in
                        NavigationLink(value: Destination.article(article)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "book.fill")
                                    Text(article.title)
                                }
                                Text(article.author)
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                            }
                        }
                    }
                }

                Section("People") {
                    ForEach(personViewModel.persons) { person in
                        NavigationLink(value: Destination.person(person)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "person.fill")
                                    Text(person.name)
                                }
                                Text(person.age, format: .number)
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                            }
                        }
                    }
                }

                Section("Add new people") {
                    Button("Load people") {
                        personViewModel.loadPersons()
                    }

                    Button("Add people") {
                        showingPeopleSheet.toggle()
                    }
                    .sheet(isPresented: $showingPeopleSheet){
                        AddPeopleView(personViewModel: personViewModel)
                            .environmentObject(navigationRouter)
                    }

                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .article(let article):
                    Text(article.title)

                case .person(let person):
                    navigationRouter.displayDetailPersonView(person: person)
                        .environmentObject(navigationRouter)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationRouter())
    }
}