//
//  ContentView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/27/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                HeaderView()
                ContentView()
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
