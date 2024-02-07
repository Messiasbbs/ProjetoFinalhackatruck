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
                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_1280.jpg"))
                
                            
                ScrollView{
                    VStack {
                                                   
                                                ForEach(viewModel.arrayNoticias, id: \.self){ index in
                                                    
                                                    HStack{
                                                        AsyncImage(url: URL(string: index.url!),scale: 10)
                                                            
                                                        
                                                        Text(index.titulo!)
                                                        
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
