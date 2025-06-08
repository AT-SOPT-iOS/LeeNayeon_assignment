//
//  TodayTop20.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct TodayTop20: View {
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
                Text("오늘의 티빙 TOP 20")
                    .font(.bold15)
                    .foregroundColor(Color.white)
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns, spacing: 12) {
                    ForEach(0...dummyPoster.count-1, id: \.self) { index in
                        HStack {
                            Text("\(index + 1)")
                                .font(.semiBold50)
                                .foregroundColor(Color.white)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                            
                            Image("\(dummyPoster[index])")
                        }
                    }
                }
            }
        }.padding(.leading, 12)
        
    }
}
