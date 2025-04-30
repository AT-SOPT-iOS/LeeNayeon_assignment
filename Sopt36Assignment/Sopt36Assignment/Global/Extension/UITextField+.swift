//
//  UITextField+.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/19/25.
//

import UIKit

extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues{ $0 }
        )
    }
    
    func addLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
