//
//  TabbarViewModel.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var tabs: [TabItem] = [
        TabItem(title: "Home", icon: "house.fill", view: AnyView(HomeView())),
        TabItem(title: "Pesquisa", icon: "magnifyingglass", view: AnyView(SearchView())),
        TabItem(title: "Favoritos", icon: "heart.fill", view: AnyView(FavoritesView())),
        TabItem(title: "Profile", icon: "person.fill", view: AnyView(ProfileView()))
    ]
}

