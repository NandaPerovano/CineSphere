//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 04/02/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var scale: CGFloat = 0.8  // Controle de escala
    @State private var opacity: Double = 0  // Controle de opacidade
    @State private var isActive = false  // Controle de navegação
    
    // Tempo de duração da animação
    let animationDuration: Double = 2.0
    
    var body: some View {
        ZStack {
            Color.black // Fundo preto, remete a cinemas
            
            // Logo ou imagem do filme
            Image(systemName: "film.fill")  // Você pode substituir por sua própria imagem
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .opacity(opacity)
                .scaleEffect(scale)
                .onAppear {
                    // Inicia animação quando a Splash Screen aparecer
                    withAnimation(.easeOut(duration: animationDuration)) {
                        scale = 1.0  // Aumenta o tamanho
                        opacity = 1.0  // Aumenta a opacidade
                    }
                    
                    // Após a animação, navega para a tela principal após 2 segundos
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            
            // Transição para a tela principal (HomeView)
            NavigationLink(destination: HomeView(), isActive: $isActive) {
                EmptyView()
            }
        }
        .edgesIgnoringSafeArea(.all)  // Ignora as bordas da tela
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

