//
//  LiveRanking.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct LiveRanking: View {
    let dummyRanking = LiveRankingModel.dummy()
    
    let columns = [GridItem(.fixed(80))]
    
    var body: some View {
        VStack{
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.bold15)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.medium12)
                    .foregroundColor(Color.gray2
                    )
                    .padding(.trailing, 4)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns, spacing: 7) {
                    ForEach(0...dummyRanking.count-1, id: \.self) { index in
                        VStack {
                            dummyRanking[index].movieImg
                                .resizable()
                                .frame(width: 160, height: 80)
                                .cornerRadius(3)
                            
                            HStack(alignment: .top) {
                                Text("\(dummyRanking[index].ranking)")
                                    .font(.bold19)
                                    .foregroundColor(Color.white)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("\(dummyRanking[index].title)")
                                        .font(.medium10)
                                        .foregroundColor(Color.white)
                                    
                                    Text("\(dummyRanking[index].subtitle)")
                                        .font(.regular10)
                                        .foregroundColor(.gray2)
                                    
                                    Text("\(dummyRanking[index].rating)")
                                        .font(.regular10)
                                        .foregroundColor(.gray2)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
        }.padding(.leading, 12)
        
    }
}

