//
//  RocketsView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 05/02/24.
//

import SwiftUI

struct RocketsView: View {
    @StateObject var viewModel = ViewModel()
    @State var aux: Foguetes?
    @State var showModal: Bool = false
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
                                                   
                                                ForEach(viewModel.arrayFoguetes, id: \.self){ index in
                                                    
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
                                                swiftfogueteView(aux: $aux)
                                                }

                    
                }
                .padding()
                }.onAppear(){
                    viewModel.foguetes()
                           
                       
                      
                       
                   }.ignoresSafeArea()
        }
    }
}

struct RocketsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsView()
    }
}
