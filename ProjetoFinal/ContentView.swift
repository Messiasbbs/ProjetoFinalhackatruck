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
                    Label("", systemImage: "studentdesk")
                    
                }
            RocketsView()
                .tabItem{
                    Label("foguetes", systemImage: "photo.artframe")
                    
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
