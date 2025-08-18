//
//  ContentView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/27/25.
//

import SwiftUI

enum Tab {
    case home
    case drama
    case entertainment
    case movie
    case sports
    case news
}

struct MainView: View {
    @State var selectedTab: Tab = .home
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    HeaderView()
                    
                    Section(header: TabbarView(selectedTab: $selectedTab)) {
                        switch selectedTab {
                        case .home:
                            HomeView()
                        case .drama:
                            DramaView()
                        case .entertainment:
                            EntertainmentView()
                        case .movie:
                            MovieView()
                        case .sports:
                            SportsView()
                        case .news:
                            NewsView()
                        }
                        Spacer()
                    }
                }
            }
            .padding(.top, 15)
        }
    }
}
