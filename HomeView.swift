//
//  HomeView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct HomeView: View {
    //@State private var rotation: Double = 0
    @State private var isRotating = false
    var body: some View {
        GeometryReader{ g in
            ZStack{
                
                Color.black
                
                Image("foto1terra") // Substitua "planet" pelo nome da sua imagem do planeta
                    .resizable()
                    .scaledToFill()
                    .padding(.top)
                    .ignoresSafeArea()
                    .frame(width: g.size.width, height: g.size.height)
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .animation(Animation.linear(duration: 35).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.isRotating = true
                        
                    }
                
                VStack{
                    
                    HStack{
                        Image("logo hackatruck")
                            .resizable()
                            .frame(width:100, height: 100 )
                        
                        
                        
                    }
                    
                    Spacer()
                    VStack{
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                }.padding(10)
                
            }
            .ignoresSafeArea()
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
//https://api.spacexdata.com/v5/launches/latest
