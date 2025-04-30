//
//  UILabel+.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/22/25.
//

import UIKit
extension UILabel{
    func setLineSpacingAndAlignment(spacing: CGFloat, alignment : NSTextAlignment){
        guard let text = text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        style.alignment = alignment
        
        attributedString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        attributedText = attributedString
    }
    
}
