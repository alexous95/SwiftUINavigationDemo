//
//  PersonListView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 13/07/2022.
//

import SwiftUI

struct PersonListView: View {
    var person: Person

    var body: some View {
        let imageName = "\(person.age).circle.fill"

        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20.0, height: 20.0)
                Text(person.name)
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20.0, height: 20.0)
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 15) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 20.0, height: 20.0)
                Text(person.adress)
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(person: Person(name: "Test", age: 9, adress: "Test adresse"))
    }
}
