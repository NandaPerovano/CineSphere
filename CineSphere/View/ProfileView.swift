//
//  ProfileView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @AppStorage("userName") var name: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: UIImage? = nil

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Foto de Perfil")) {
                    HStack {
                        Spacer()
                        if let image = profileImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }

                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Text("Selecionar foto")
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                profileImage = uiImage
                            }
                        }
                    }
                }

                Section(header: Text("Informações do Usuário")) {
                    TextField("Insira seu nome", text: $name)
                }
            }
            .navigationTitle("Perfil")
        }
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel())
}
