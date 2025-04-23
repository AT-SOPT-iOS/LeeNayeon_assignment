//
//  String+.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/22/25.
//

import UIKit
extension String{
    func isValidEmail() -> Bool{
        let regExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: self)
    }
    
    func isValidNickname() -> Bool{
        let regExp = "^[가-힣ㄱ-ㅎ]{0,10}$"
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: self)
    }
    
    func isValidPassword() -> Bool{
        let regExp = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: self)
    }
}
