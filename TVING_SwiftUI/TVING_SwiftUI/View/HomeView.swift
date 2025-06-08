//
//  HomeView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        ScrollView {
            Image("mainPoster")
                .resizable()
                .frame(height: 400)
                .frame(maxWidth: .infinity)
            
            TodayTop20()
                .padding(.top, 9)
            
            LiveRanking()
                .padding(.top, 18)
            
            RankingMovie()
                .padding(.top, 18)
            
            Baseball()
                .padding(.top, 28)
            
            SportsTV()
                .padding(.top, 28)
            
            PDLike()
                .padding(.top, 25)
            
            FooterView()
                .padding(.top, 23)
        }
    }
}
