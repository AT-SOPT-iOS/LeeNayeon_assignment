//
//  Baseball.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct Baseball: View {
    let dummyImg = [
      "baseball1", "baseball2", "baseball3", "baseball4", "baseball5",
      "baseball6", "baseball7", "baseball8", "baseball9", "baseball10"
    ]
    
    let columns = [GridItem(.fixed(50))]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: 0) {
                ForEach(0...dummyImg.count-1, id: \.self) { index in
                    Image("\(dummyImg[index])")
                        .resizable()
                        .frame(width: 53, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 45)
                        .background(index % 2 == 0 ? Color.white : Color.black)
                        
                }
                
            }
        }
    }
}

#Preview {
    Baseball()
}
