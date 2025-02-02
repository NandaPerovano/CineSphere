//
//  ContentView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        TabView {
            ForEach(viewModel.tabs) { tab in
                tab.view
                    .tabItem {
                        Image(systemName: tab.icon)
                        Text(tab.title)
                    }
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
