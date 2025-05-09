//
//  BoxOfficeTableViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/9/25.
//

import UIKit

import SnapKit
import Then

class BoxOfficeTableViewCell: UITableViewCell {
    
    static let identifier: String = "BoxOfficeTableViewCell"
    
    private let rankLabel = UILabel()
    private let movieTitleLabel = UILabel()
    private let openDateLabel = UILabel()
    private let totalGalleryCountLabel = UILabel()
    private let dividerView = UIView()
    
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
        self.contentView.addSubviews(
            rankLabel,
            movieTitleLabel,
            openDateLabel,
            totalGalleryCountLabel,
            dividerView
        )
    }
    
    private func setStyle(){
        contentView.backgroundColor = .black
        
        rankLabel.textColor = .white
        rankLabel.font = .pretendard(.bold, size: 17)
        
        movieTitleLabel.textColor = .white
        movieTitleLabel.font = .pretendard(.bold, size: 15)
        
        openDateLabel.textColor = .gray2
        openDateLabel.font = .pretendard(.regular, size: 14)
        
        totalGalleryCountLabel.textColor = .white
        totalGalleryCountLabel.font = .pretendard(.semiBold, size: 15)
        
        dividerView.backgroundColor = .gray2
    }
    
    private func setLayout(){
        rankLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        
        movieTitleLabel.snp.makeConstraints{
            $0.top.equalTo(rankLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        
        totalGalleryCountLabel.snp.makeConstraints {
            $0.top.equalTo(openDateLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        
        dividerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(totalGalleryCountLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}

extension BoxOfficeTableViewCell {
    func dataBind(with data: BoxOfficeResponseData) {
        rankLabel.text = data.rank
        movieTitleLabel.text = data.movieNm
        openDateLabel.text = "개봉 날짜: \(data.openDt) "
        totalGalleryCountLabel.text = "누적 관객: \(data.audiAcc)명 " 
    }
}
