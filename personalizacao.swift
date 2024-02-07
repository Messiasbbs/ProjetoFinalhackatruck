//
//  personalizacao.swift
//  ProjetoFinal
//
//  Created by Turma02-19 on 07/02/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case globe = "globe.europe.africa.fill"
    case noticia = "scroll.fill"
    case photo = "text.below.photo.fill"
    case info = "book.closed.fill"
    case foguete = "bubbles.and.sparkles.fill"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ""
    }
    private var tabColor: Color {
        switch selectedTab {
        case .globe:
            return .black
        case .noticia:
            return .black
        case .photo:
            return .black
        case .info:
            return .black
        case .foguete:
            return .black
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.globe))
    }
}
