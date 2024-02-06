//
//  PhotosDayView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct PhotosDayView: View {
    @StateObject var viewModel = ViewModel()
  //  @State var teste: PhotosDAY
    var body: some View {
        ZStack{
            
            Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.black, .blue]),
                                startPoint: .top,
                                endPoint: .trailing)
                        )
                        
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
            }.onAppear(){
                viewModel.fotos()
                       
                   
                  
                   
               }.ignoresSafeArea()

    }
}

struct PhotosDayView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosDayView()
    }
}
//teste: PhotosDAY(date: "1", explanation: "2", hdurl: "3", title: "4", link: "5"
