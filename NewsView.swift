//
//  NewsView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct NewsView: View {
    @State var aux: Noticias?
    @State var showModal: Bool = false
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                
                Image("fundo")
                    .resizable()
                
                            
                ScrollView{
                    VStack {
                                                   
                                                ForEach(viewModel.arrayNoticias, id: \.self){ index in
                                                    
                                                    VStack{
                                                        AsyncImage(url: URL(string: index.url!),scale: 10)
                                                            
                                                        
                                                        Text(index.titulo!)
                                                            .font(.system(size: 15))
                                                            .multilineTextAlignment(.leading)
                                                            .foregroundColor(.white)
                                                            .frame(maxWidth: 260)
                                                            
                                                    }.onTapGesture {
                                                        
                                                        aux = index
                                                        
                                                        print(index)
                                                        
                                                        self.showModal.toggle()
                                                        
                                                    }
                                                }
                                                
                                                Spacer()
                                                    
                                            }.sheet(isPresented: $showModal){
                                                swiftView(aux: $aux)
                                                }

                    
                }
                .padding()
                }.ignoresSafeArea().onAppear(){
                    viewModel.noticias()
                       
                   }
        }
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
