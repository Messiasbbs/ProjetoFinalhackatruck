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
                
                Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black, .blue]),
                                    startPoint: .top,
                                    endPoint: .trailing)
                            )
                            
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
                }.onAppear(){
                    viewModel.noticias()
                           
                       
                      
                       
                   }.ignoresSafeArea()
        }
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
