//
//  NewsView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            
            ForEach(viewModel.arrayNoticias, id: \.self){ index in
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
            viewModel.noticias()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
