//
//  TabbarView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct TabbarView: View {
    @Binding var selectedTab: Tab
    
    private let tabs: [Tab] = [.home, .drama, .entertainment, .movie, .sports, .news]
        private let tabTitles: [Tab: String] = [
            .home: "홈", .drama: "드라마", .entertainment: "예능",
            .movie: "영화", .sports: "스포츠", .news: "뉴스"
        ]
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    VStack(spacing: 7) {
                        Button {
                            selectedTab = tab
                        } label: {
                            Text(tabTitles[tab] ?? "")
                                .font(.regular17)
                                .foregroundColor(.white)
                        }
                        
                        Rectangle()
                            .fill(selectedTab == tab ? Color.white : Color.clear)
                            .frame(height: 3)
                    }
                }
            }
            
            Rectangle()
                .fill(Color.gray2)
                .frame(height: 1)
            
        }.background(Color.black)
    }
}
