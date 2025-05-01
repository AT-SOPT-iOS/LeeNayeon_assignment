//
//  InfoLabel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class InfoLabel : UILabel {
    init(text: String, textColor: UIColor = .gray2) {
        super.init(frame: .zero)
        self.font = .pretendard(.medium, size: 11)
        self.text = text
        self.textColor = textColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
