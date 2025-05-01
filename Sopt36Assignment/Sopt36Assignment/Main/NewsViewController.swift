//
//  NewsViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

final class NewsViewController : UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setUI(){
        self.view.addSubviews(titleLabel)
    }
    
    private func setStyle(){
        titleLabel.text = "뉴스"
        titleLabel.textColor = .white
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
