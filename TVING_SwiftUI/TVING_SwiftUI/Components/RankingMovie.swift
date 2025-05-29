//
//  RankingMovie.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct RankingMovie: View {
    let dummyPoster = [
        "movie1","movie2", "movie3", "movie4",
        "movie1","movie2", "movie3", "movie4",
        "movie1","movie2", "movie3", "movie4",
        "movie1","movie2", "movie3", "movie4",
        "movie1","movie2", "movie3", "movie4"
    ]
    
    let columns = [GridItem(.fixed(146))]
    
    var body: some View {
        VStack{
            HStack {
                Text("실시간 인기 영화")
                    .font(.bold15)
                    .foregroundColor(Color.white)
    
                Spacer()
                
                Text("더보기")
                    .font(.medium12)
                    .foregroundColor(Color.gray2)
                    .padding(.trailing, 4)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns, spacing: 12) {
                    ForEach(0...dummyPoster.count-1, id: \.self) { index in
                        Image("\(dummyPoster[index])")
                    }
                }
            }
        }.padding(.leading, 12)
        
    }
}
