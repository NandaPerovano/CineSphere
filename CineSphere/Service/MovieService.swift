//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 02/02/25.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    private init() {}

   
    let movies: [Movie] = [
        Movie(title: "Interestelar", description: "Uma jornada além do tempo e espaço.", imageName: "interstellar"),
        Movie(title: "A Origem", description: "Um ladrão que rouba segredos dos sonhos.", imageName: "inception"),
        Movie(title: "O Cavaleiro das Trevas", description: "O Batman enfrenta o Coringa.", imageName: "darkKnight"),
        Movie(title: "Clube da Luta", description: "Um homem insatisfeito encontra um mundo subterrâneo de luta.", imageName: "fightClub"),
        Movie(title: "Forrest Gump", description: "A incrível jornada de um homem através da história dos EUA.", imageName: "forrestGump"),
        Movie(title: "Os Vingadores", description: "Os maiores heróis da Terra unem forças para salvar o mundo.", imageName: "avengers"),
        Movie(title: "Matrix", description: "Um hacker descobre a verdade sobre sua realidade.", imageName: "matrix"),
        Movie(title: "Senhor dos Anéis: A Sociedade do Anel", description: "Frodo embarca em uma missão para destruir o Um Anel.", imageName: "lordOfTheRings"),
        Movie(title: "Gladiador", description: "Um general romano busca vingança contra um imperador corrupto.", imageName: "gladiator"),
        Movie(title: "Titanic", description: "Uma história de amor a bordo do navio mais famoso do mundo.", imageName: "titanic"),
        Movie(title: "Coringa", description: "A origem sombria do maior vilão de Gotham.", imageName: "joker"),
        Movie(title: "Duna", description: "Um jovem herdeiro deve enfrentar desafios em um planeta desértico.", imageName: "dune"),
        Movie(title: "O Resgate do Soldado Ryan", description: "Um grupo de soldados busca resgatar um único homem na Segunda Guerra Mundial.", imageName: "savingPrivateRyan"),
        Movie(title: "Harry Potter e a Pedra Filosofal", description: "Um jovem descobre que é um bruxo e entra para Hogwarts.", imageName: "harryPotter")
    ]
}

