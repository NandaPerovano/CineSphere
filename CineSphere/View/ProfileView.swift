//
//  ProfileView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("userName") var name: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Informações do Usuário")) {
                TextField("Insira seu nome", text: $name)
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel())
}
