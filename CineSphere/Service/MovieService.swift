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
        Movie(
            title: "Interestelar",
            description: "Uma jornada além do tempo e espaço.",
            imageName: "interstellar",
            releaseYear: "2014",
            detailedDescription: "Em um futuro onde a Terra está morrendo, um grupo de astronautas embarca em uma missão para encontrar um novo lar para a humanidade através de um buraco de minhoca no espaço.",
            mainActors: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"]
        ),
        Movie(
            title: "A Origem",
            description: "Um ladrão que rouba segredos dos sonhos.",
            imageName: "inception",
            releaseYear: "2010",
            detailedDescription: "Dom Cobb é um especialista em invadir os sonhos das pessoas para roubar seus segredos. Agora, ele recebe uma tarefa ainda mais difícil: implantar uma ideia na mente de alguém.",
            mainActors: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page"]
        ),
        Movie(
            title: "O Cavaleiro das Trevas",
            description: "O Batman enfrenta o Coringa.",
            imageName: "darkKnight",
            releaseYear: "2008",
            detailedDescription: "Batman enfrenta o Coringa, um criminoso caótico que ameaça Gotham City. Enquanto tenta proteger a cidade, Bruce Wayne luta com seus próprios dilemas morais.",
            mainActors: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"]
        ),
        Movie(
            title: "Clube da Luta",
            description: "Um homem insatisfeito encontra um mundo subterrâneo de luta.",
            imageName: "fightClub",
            releaseYear: "1999",
            detailedDescription: "Um homem deprimido e insatisfeito com a vida encontra um misterioso vendedor de sabonetes chamado Tyler Durden. Juntos, eles fundam um clube secreto de lutas clandestinas.",
            mainActors: ["Edward Norton", "Brad Pitt", "Helena Bonham Carter"]
        ),
        Movie(
            title: "Forrest Gump",
            description: "A incrível jornada de um homem através da história dos EUA.",
            imageName: "forrestGump",
            releaseYear: "1994",
            detailedDescription: "A vida de Forrest Gump, um homem simples, mas com um coração enorme, que sem querer se torna parte de momentos históricos dos EUA enquanto busca seu grande amor, Jenny.",
            mainActors: ["Tom Hanks", "Robin Wright", "Gary Sinise"]
        ),
        Movie(
            title: "Os Vingadores",
            description: "Os maiores heróis da Terra unem forças para salvar o mundo.",
            imageName: "avengers",
            releaseYear: "2012",
            detailedDescription: "Liderados por Nick Fury, heróis como Homem de Ferro, Capitão América, Thor, Hulk, Viúva Negra e Gavião Arqueiro se unem para impedir que Loki conquiste a Terra.",
            mainActors: ["Robert Downey Jr.", "Chris Evans", "Scarlett Johansson"]
        ),
        Movie(
            title: "Matrix",
            description: "Um hacker descobre a verdade sobre sua realidade.",
            imageName: "matrix",
            releaseYear: "1999",
            detailedDescription: "Neo descobre que a realidade em que vive é uma simulação criada por máquinas e se junta à resistência liderada por Morpheus para libertar a humanidade.",
            mainActors: ["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss"]
        ),
        Movie(
            title: "Senhor dos Anéis: A Sociedade do Anel",
            description: "Frodo embarca em uma missão para destruir o Um Anel.",
            imageName: "lordOfTheRings",
            releaseYear: "2001",
            detailedDescription: "Frodo Bolseiro recebe a missão de destruir o Um Anel, que tem o poder de corromper qualquer um que o possua. Ele parte em uma jornada perigosa com a ajuda de amigos e aliados.",
            mainActors: ["Elijah Wood", "Ian McKellen", "Viggo Mortensen"]
        ),
        Movie(
            title: "Gladiador",
            description: "Um general romano busca vingança contra um imperador corrupto.",
            imageName: "gladiator",
            releaseYear: "2000",
            detailedDescription: "Maximus, um general romano traído e reduzido à escravidão, se torna um gladiador e luta para vingar sua família e restaurar a honra de Roma.",
            mainActors: ["Russell Crowe", "Joaquin Phoenix", "Connie Nielsen"]
        ),
        Movie(
            title: "Titanic",
            description: "Uma história de amor a bordo do navio mais famoso do mundo.",
            imageName: "titanic",
            releaseYear: "1997",
            detailedDescription: "Jack e Rose vivem um romance proibido a bordo do Titanic, um luxuoso navio condenado a um trágico destino ao colidir com um iceberg.",
            mainActors: ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"]
        ),
        Movie(
            title: "Coringa",
            description: "A origem sombria do maior vilão de Gotham.",
            imageName: "joker",
            releaseYear: "2019",
            detailedDescription: "Arthur Fleck, um comediante falido e marginalizado pela sociedade, desce a um caminho sombrio que o transforma no icônico vilão Coringa.",
            mainActors: ["Joaquin Phoenix", "Robert De Niro", "Zazie Beetz"]
        ),
        Movie(
            title: "Duna",
            description: "Um jovem herdeiro deve enfrentar desafios em um planeta desértico.",
            imageName: "dune",
            releaseYear: "2021",
            detailedDescription: "Paul Atreides, um jovem nobre, viaja ao perigoso planeta Arrakis, onde deve lutar pelo controle da especiaria mais valiosa do universo e cumprir seu destino.",
            mainActors: ["Timothée Chalamet", "Zendaya", "Oscar Isaac"]
        ),
        Movie(
            title: "O Resgate do Soldado Ryan",
            description: "Um grupo de soldados busca resgatar um único homem na Segunda Guerra Mundial.",
            imageName: "savingPrivateRyan",
            releaseYear: "1998",
            detailedDescription: "Durante a Segunda Guerra Mundial, um grupo de soldados é enviado atrás das linhas inimigas para resgatar o único filho sobrevivente de uma mãe que perdeu seus outros filhos na guerra.",
            mainActors: ["Tom Hanks", "Matt Damon", "Vin Diesel"]
        ),
        Movie(
            title: "Harry Potter e a Pedra Filosofal",
            description: "Um jovem descobre que é um bruxo e entra para Hogwarts.",
            imageName: "harryPotter",
            releaseYear: "2001",
            detailedDescription: "Harry Potter, um órfão que vive com seus tios cruéis, descobre que é um bruxo e é convidado para estudar em Hogwarts, onde vive aventuras mágicas e descobre seu verdadeiro destino.",
            mainActors: ["Daniel Radcliffe", "Emma Watson", "Rupert Grint"]
        )
    ]
}
