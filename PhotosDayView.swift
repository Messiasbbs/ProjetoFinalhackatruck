//
//  PhotosDayView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct PhotosDayView: View {
    @StateObject var viewModel = ViewModel()
    @State private var isAnimating = false
    
    
  //  @State var teste: PhotosDAY
    var body: some View {
        ZStack{
            
            Image("fundo")
                .resizable()
            ScrollView{
                VStack{
                                    ForEach(viewModel.arrayPhotosDay, id: \.self){ foto in
                                        
                                        VStack{
                                            
                                            AsyncImage(url: URL(string: foto.hdurl!)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .padding([.top, .leading])
                                            .frame(width: 280, height: 280)
                                            .multilineTextAlignment(.center)
                                            
                                            Text(foto.date!)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                                .padding(.trailing)
                                            
                                        }
                                        Text(foto.title!)
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: 360)
                                        //Spacer()
                                        Text(foto.explanation!)
                                            .font(Font.custom("MyFont", size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: 360)
                                        
                                    }.padding()
                                    
                                }.padding()
                
                }
            }.ignoresSafeArea()
.onAppear(){
                viewModel.fotos()
                       
                   
                  
                   
               }
    }
}

struct PhotosDayView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosDayView()
    }
}
//teste: PhotosDAY(date: "1", explanation: "2", hdurl: "3", title: "4", link: "5"
