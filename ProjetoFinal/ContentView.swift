//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem{
                    Label("Inicio", systemImage: "network")
                }
            NewsView()
                .tabItem{
                    Label("Noticias", systemImage: "newspaper")
                }
            PhotosDayView()
                .tabItem{
                    Label("Foto Do Dia", systemImage: "photo.artframe")
                    
                }
            InfoView()
                .tabItem{
                    Label("", systemImage: "text.book.closed.fill")
                    
                }
            RocketsView()
                .tabItem{
                    Label("foguetes", image: "icons8-rocket-26 (2)")
                    
                }
        


        }
        .accentColor(Color.yellow)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
