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
        ZStack{
                        Image("fundo")
                            .resizable()
                                    
                        ScrollView{
                            VStack {
                                Text("Planetas 🌎")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                                    .fontWeight(.semibold)
                                Text("")
                                Text("")
                                ForEach(viewModel.arrayInfo, id: \.self){ inf in
                                VStack{
                                    Text(inf.titulo!)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 260)
                                    }.onTapGesture {
                                        aux = inf
                                        print(inf)
                                        self.showModal.toggle()
                                    }
                                    Text("")
                                }
                                Spacer()
                            }.sheet(isPresented: $showModal){
                                swiftinfoView(aux: $aux)
                                    .presentationDetents([.fraction(0.9)])
                                    .presentationDragIndicator(.visible)
                                
                            }
                        }
                        .padding()
                        }.ignoresSafeArea().onAppear(){
                            viewModel.info()
                                   
                               
                              
                               
                           }
                }
        }
    

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
