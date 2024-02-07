//
//  swiftView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 06/02/24.
//

import SwiftUI

struct swiftView: View {
    @Binding var aux: Noticias?
    
    var body: some View {
        VStack{
            if(aux != nil){
                Text(aux!.titulo!)
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .padding(.bottom)
                Text(aux!.resumo!)
                    .foregroundColor(Color.black)
                    .padding(.bottom)
        
                Text("Link para materia:")
                        .foregroundColor(Color.black)
                Text(aux!.link!)
                        .foregroundColor(Color.blue)
                
                
                    
            }
            
        }
        
        
        
        
    }
}


