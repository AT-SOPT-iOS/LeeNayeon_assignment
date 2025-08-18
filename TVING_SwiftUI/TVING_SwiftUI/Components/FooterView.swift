//
//  FooterView.swift
//  TVING_SwiftUI
//
//  Created by 이나연 on 5/30/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("공지")
                    .foregroundColor(Color.gray2)
                    .padding(.leading, 17)
                
                Button {
                    print("공지 텍스트 눌림")
                } label: {
                    Text("티빙 계정 공유 정책 추가 안내")
                        .foregroundColor(Color.white)
                }
            
                Spacer()
                
                Button {
                    print("btn_forward")
                } label: {
                    Image("btn_forward")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 16)
                }
                
            }
            .font(.medium11)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.gray4)
            .cornerRadius(5)
            .padding([.leading, .trailing], 14)
            
        
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 3) {
                    Button {
                        print("고객 문의 눌림")
                    } label: {
                        Text("고객 문의")
                    }
                    
                    Text("·")
                    
                    Button {
                        print("이용 약관 눌림")
                    } label: {
                        Text("이용약관")
                    }
                    
                    Text("·")
                    
                    Button {
                        print("개인정보 눌림")
                    } label: {
                        Text("개인정보처리방침")
                            .foregroundColor(Color.white)
                    }
                }
                
                HStack(spacing: 3) {
                    Button {
                        print("사업자정보 눌림")
                    } label: {
                        Text("사업자정보")
                    }
                    
                    Text("·")
                    
                    Button {
                        print("인재 채용 눌림")
                    } label: {
                        Text("인재 채용")
                    }
                }
            }
            .foregroundColor(Color.gray2)
            .font(.medium11)
            .padding(.top, 13)
            .padding(.leading, 16)
        }
    }
}
