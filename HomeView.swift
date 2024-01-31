//
//  HomeView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .blue]),
                        startPoint: .top,
                        endPoint: .trailing)
                )
                
            VStack{
                
                HStack{
                    Text("AQUI VAI FICAR A LOGO E O NOME ")
                }
                .padding(.top)
                Spacer()
                HStack{
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 100, height: 100)
                                    .background(.red)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
                
            }
            
        }
        .ignoresSafeArea()
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
