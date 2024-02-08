//
//  SwiftinfoView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 06/02/24.
//

import SwiftUI

struct swiftinfoView: View {
    @Binding var aux: Info?
    
    var body: some View {
        VStack{
                    Text("")
                    Spacer()
                    if(aux != nil){
                        HStack{
                            AsyncImage(url: URL(string:aux!.url!)){
                                image in image
                                    .image?
                                    .resizable()
                            }
                            .frame(width: 100, height: 100)
                            Text("")
                            Text(aux!.titulo!)
                                .font(.system(size: 30))
                        }
                        Spacer()
                        Text(aux!.resumo!)
                        Text("")
                        Link("Mais informacoes sobre este planeta", destination: URL(string: aux!.link!)!)
                            .font(.system(size: 20))
                        Text("")
                    }
                    
                }
        
        
        
        
    }
}
