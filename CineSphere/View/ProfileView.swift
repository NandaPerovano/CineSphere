//
//  ProfileView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI
import PhotosUI
import CoreData

struct ProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: UserProfile.entity(),
        sortDescriptors: []
    ) private var profiles: FetchedResults<UserProfile>
    
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
                                saveProfileImageToCoreData(data: data)
                            }
                        }
                    }
                }

                Section(header: Text("Informações do Usuário")) {
                    TextField("Insira seu nome", text: $name)
                        .onChange(of: name) { _ in
                            saveNameToCoreData()
                        }
                }
            }
            .navigationTitle("Perfil")
            .onAppear {
                loadProfile()
            }
        }
    }

    private func saveProfileImageToCoreData(data: Data) {
        let profile = profiles.first ?? UserProfile(context: viewContext)
        profile.profileImage = data
        saveContext()
    }

    private func saveNameToCoreData() {
        let profile = profiles.first ?? UserProfile(context: viewContext)
        profile.name = name
        saveContext()
    }

    private func loadProfile() {
        guard let profile = profiles.first else { return }
        if let data = profile.profileImage {
            profileImage = UIImage(data: data)
        }
        name = profile.name ?? ""
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Erro ao salvar no Core Data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel())
}
