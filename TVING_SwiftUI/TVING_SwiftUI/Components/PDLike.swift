//
//  PDLike.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct PDLike: View {
    let dummyPoster = [
       "poster1", "poster2", "poster3", "poster4", "poster5", "poster6"
    ]
    
    let columns = [GridItem(.fixed(90))]
    
    var body: some View {
        VStack{
            HStack {
                Text("김가현PD의 인생작 TOP 6")
                    .font(.bold15)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.medium12)
                    .foregroundColor(Color.gray2)
                    .padding(.trailing, 4)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns, spacing: 7) {
                    ForEach(0...dummyPoster.count-1, id: \.self) { index in
                        Image("\(dummyPoster[index])")
                            .resizable()
                            .frame(width: 160, height: 90)
                            .cornerRadius(3)
                    }
                }
            }
        }.padding(.leading, 12)
        
    }
}
