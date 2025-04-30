//
//  UIView+.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/19/25.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
        }
    }
}
