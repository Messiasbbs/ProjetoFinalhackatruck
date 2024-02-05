//
//  PhotosDayView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct PhotosDayView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack{
                   
                   
                       VStack{
                           
                           ForEach(viewModel.arrayPhotosDay, id: \.self){ index in
                               ScrollView{
                                   HStack{
                                       AsyncImage(url: URL(string: index.hdurl!)) { image in
                                           image.resizable()
                                       } placeholder: {
                                           ProgressView()
                                       }
                                       .padding([.top, .leading])
                                       .frame(width: 300, height: 300)
                                       Text(index.date!)
                                           .foregroundColor(Color.blue)
                                           .padding(.trailing)
                                   }
                                   Text(index.title!)
                                       .font(.title)
                                       .foregroundColor(Color.blue)
                                   Spacer()
                                   Text(index.explanation!)
                                       .font(Font.custom("MyFont", size: 16))
                                       .foregroundColor(Color.blue)
                                       .multilineTextAlignment(.leading)
                                       .padding(.horizontal)
                                   
                               }
                               
                              
                           }
                       }
                       .onAppear(){
                           viewModel.fotos()
                       }
                   
                  
                   
               }.ignoresSafeArea()

    }
}

struct PhotosDayView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosDayView()
    }
}
