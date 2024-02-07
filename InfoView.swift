//
//  InfoView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 01/02/24.
//

import SwiftUI

struct InfoView: View {
    @State var aux: Info?
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
                                                   
                                                ForEach(viewModel.arrayInfo, id: \.self){ inf in
                                                    
                                                    HStack{
                                                        AsyncImage(url: URL(string: inf.url!),scale: 10)
                                                            
                                                        
                                                        Text(inf.titulo!)
                                                        
                                                            .multilineTextAlignment(.leading)
                                                            .foregroundColor(.white)
                                                            .frame(maxWidth: 260)
                                                            
                                                    }.onTapGesture {
                                                        
                                                        aux = inf
                                                        
                                                        print(inf)
                                                        
                                                        self.showModal.toggle()
                                                        
                                                    }
                                                }
                                                
                                                Spacer()
                                                    
                                            }.sheet(isPresented: $showModal){
                                                swiftinfoView(aux: $aux)
                                                }

                    
                }
                .padding()
                }.ignoresSafeArea().onAppear(){
                    viewModel.info()
                           
                       
                      
                       
                   }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
