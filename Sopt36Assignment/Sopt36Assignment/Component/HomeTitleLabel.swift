//
//  HomeTitleLabel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class HomeTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = .pretendard(.bold, size: 15)
        self.textColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
