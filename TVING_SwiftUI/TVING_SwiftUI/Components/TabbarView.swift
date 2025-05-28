//
//  TabbarView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct TabbarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                selectedTab = .home
            } label: {
                Text("홈")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button {
                selectedTab = .drama
            } label: {
                Text("드라마")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button {
                selectedTab = .entertainment
            } label: {
                Text("예능")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button {
                selectedTab = .movie
            } label: {
                Text("영화")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button {
                selectedTab = .sports
            } label: {
                Text("스포츠")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            Button {
                selectedTab = .news
            } label: {
                Text("뉴스")
                    .font(.regular17)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
        }
    }
}
