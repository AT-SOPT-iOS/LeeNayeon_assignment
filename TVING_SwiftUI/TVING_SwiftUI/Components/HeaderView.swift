//
//  HeaderView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/29/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("mainTving")
                .resizable()
                .frame(width: 191, height: 78)
            
            Spacer()
            
            Image("search")
                .resizable()
                .frame(width: 30, height: 30)
            
            Image("profileImg")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    HeaderView()
}
