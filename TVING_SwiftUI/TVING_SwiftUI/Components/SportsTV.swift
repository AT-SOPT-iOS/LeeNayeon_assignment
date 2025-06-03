//
//  SportsTV.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct SportsTV: View {
    let dummyImg = [
      "appleTVimg", "kboImg", "kblImg", "afcImg"
    ]
    
    let columns = [GridItem(.fixed(45))]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: 7) {
                ForEach(0...dummyImg.count-1, id: \.self) { index in
                    Image("\(dummyImg[index])")
                        .resizable()
                        .frame(width: 68, height: 34)
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 90, height: 45)
                .background(Color.gray4)
                .cornerRadius(3)
            }
        }.padding(.leading, 15)
    }
}
