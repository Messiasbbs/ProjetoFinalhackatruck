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
            
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue, Color.purple, Color.black]), startPoint: .top, endPoint: .bottom)
                     .mask(
                         Circle()
                             .frame(width: 1000, height: 1000)
                     )
                     
                     
                     .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true))
                     .onAppear() {
                         self.isAnimating = true
                     }
            ScrollView{
                VStack{
                    ForEach(viewModel.arrayPhotosDay, id: \.self){ foto in
                        
                            HStack{
                                AsyncImage(url: URL(string: foto.hdurl!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .padding([.top, .leading])
                                .frame(width: 300, height: 300)
                                Text(foto.date!)
                                    .foregroundColor(Color.white)
                                    .padding(.trailing)
                            }
                            Text(foto.title!)
                                .font(.title)
                                .foregroundColor(Color.white)
                            Spacer()
                            Text(foto.explanation!)
                                .font(Font.custom("MyFont", size: 16))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                            
                       
                        
                       
                    }
                }
                
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
