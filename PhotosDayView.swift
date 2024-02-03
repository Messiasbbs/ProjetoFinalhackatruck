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
                   
                   ScrollView {
                       VStack{
                           
                           ForEach(viewModel.arrayPhotosDay, id: \.self){ index in
                               HStack{
                                   AsyncImage(url: URL(string: index.hdurl!)) { image in
                                       image.resizable()
                                   } placeholder: {
                                       ProgressView()
                                   }
                                   .frame(width: 300, height: 300)
                                   Text(index.date!)
                                       .foregroundColor(Color.white)
                                       .padding(.trailing)
                               }
                               Text(index.title!)
                                   .font(.title)
                                   .foregroundColor(Color.white)
                               Spacer()
                               Text(index.explanation!)
                                   .font(Font.custom("MyFont", size: 16))
                                   .foregroundColor(Color.white)
                                   .multilineTextAlignment(.leading)
                                   .padding(.horizontal)
                               
                               
                               
                               
                               
                               
                               
                   
                              
                           }
                       }
                       .onAppear(){
                           viewModel.fetch()
                       }
                   }
                  
                   
               }.ignoresSafeArea()

    }
}

struct PhotosDayView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosDayView()
    }
}
