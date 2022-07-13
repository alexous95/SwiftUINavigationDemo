//
//  CustomPersonView.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import SwiftUI

struct CustomPersonView: View {

    var person: Person
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navigationRouter: NavigationRouter

    var btnBack : some View {
        Button("Home") {
            navigationRouter.removeFromPath()
        }
        .foregroundColor(.white)
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text(person.name)
                    .foregroundColor(.white)
                    .font(.title)
                Text(person.age, format: .number)
                    .foregroundColor(.white)
                    .font(.title2)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct CustomPersonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPersonView(person: Person(name: "Goncalves Alexandre", age: 24))
    }
}
