//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 31/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .globe
    @StateObject var viewModel = ViewModel()
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView{
            ZStack{
                TabView(selection: $tabSelected){
                    ForEach(Tab.allCases, id: \.rawValue){ tab in
                        HStack{
                            if(tabSelected == .globe){
                                HomeView()
                            }
                            if(tabSelected == .noticia){
                                NewsView()
                            }
                            if(tabSelected == .photo){
                                PhotosDayView()
                            }
                            if(tabSelected == .info){
                                InfoView()
                            }
                            if(tabSelected == .foguete){
                                RocketsView()
                            }
                        }
                        .tag(tab)
                    }
                }
                VStack{
                    Spacer()
                    CustomTabBar(selectedTab: $tabSelected)
                    
                }
            }
            

        }.onAppear(){
            
            viewModel.fotos()
            viewModel.FUNCIONA()
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { t in
                
                viewModel.pust(PhotosDAY2(date: nil, explanation: viewModel.arrayPhotosDay.last?.explanation, hdurl: nil, title: viewModel.arrayPhotosDay.last?.title))
                
            
                print(viewModel.arrayPhotosDay[0].explanation!)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
