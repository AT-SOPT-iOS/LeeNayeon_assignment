//
//  NewsTableViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/3/25.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsViewCell"

    private let titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUI()
            setStyle()
            setLayout()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.contentView.addSubviews(titleLabel)
    }
    
    private func setStyle(){
        contentView.backgroundColor = .black
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
