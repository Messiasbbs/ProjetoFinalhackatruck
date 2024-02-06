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
                    .foregroundColor(Color.blue)
                Text(aux!.resumo!)
                    .font(.title3)
                    .foregroundColor(Color.blue)
                Text(aux!.link!)
                    .font(.title3)
                    .foregroundColor(Color.blue)
                    
            }
            
        }
        
        
        
        
    }
}


