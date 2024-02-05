//
//  InfoView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 01/02/24.
//

import SwiftUI

struct InfoView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack{
            
            ForEach(viewModel.arrayInfo, id: \.self){ index in
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
            viewModel.info()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
