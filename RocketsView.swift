//
//  RocketsView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 05/02/24.
//

import SwiftUI

struct RocketsView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            
            ForEach(viewModel.arrayFoguetes, id: \.self){ index in
                HStack{
                   
                    Text(index.titulo!)
                        .foregroundColor(Color.blue)
                        .padding(.trailing)
                    Text(index.url!)
                        .foregroundColor(Color.blue)
                        .padding(.trailing)
                    Text(index.resumo!)
                        .foregroundColor(Color.blue)
                        .padding(.trailing)
                }
            
                
                
                
                
                
                
                
    
               
            }
        }
        .onAppear(){
            viewModel.foguetes()
        }
    }
}

struct RocketsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsView()
    }
}
