//
//  MoreButton.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class MoreButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        self.titleLabel?.font = .pretendard(.regular, size: 12)
        self.setTitleColor(.gray2, for: .normal)
        self.setTitle("더보기", for: .normal)
    }
}
