//
//  NavigationRouter.swift
//  SwiftUINavigationDemo
//
//  Created by a.b.goncalves on 12/07/2022.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {

    @Published var navigationPath: NavigationPath = NavigationPath()

    // Il y a deux moyens de push une vue avec le nouveau systeme de navigation swiftUI
    // Le premier est de creer un router qui va lui même creer et retourner une vue pour le navigationDestination
    // Cela permet d'abstraire la navigation dans une autre classe
    // La deuxième méthode est donner en binding a la navigationStack un path. On va ensuite update ce path avec la valeur que l'on souhaite et la navigationStack
    // va se mettre a jour en utilisant le bon navigationDestination
    // On utilise la deuxième méthode si on veut ajouter a la main une vue dans le path
    
    @ViewBuilder func displayDetailPersonView(person: Person) -> some View {
        switch person.name {
        case "Goncalves Alexandre":
            CustomPersonView(person: person)

        default:
            VStack {
                Text(person.name)
                Text(person.age, format: .number)
            }
        }
    }

    func addToPath<T: Hashable>(path: T) {
        navigationPath.append(path)
    }

    func removeFromPath() {
        navigationPath = .init()
    }
}
