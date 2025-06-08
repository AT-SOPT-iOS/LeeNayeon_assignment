//
//  TabbarView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            
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
            
        }
    }
}
