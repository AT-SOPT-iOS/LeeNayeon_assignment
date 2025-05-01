//
//  LiveRankingCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class LiveRankingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LiveRankingCollectionViewCell"
    
    private lazy var rankingNumber = UILabel()
    private lazy var movieImage = UIImageView()
    private lazy var infoStackView = UIStackView()
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var ratingLabel = UILabel()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    private func setUI() {
        [rankingNumber, movieImage, infoStackView].forEach {
            contentView.addSubview($0)
        }
        
        [titleLabel, subtitleLabel, ratingLabel].forEach{
            infoStackView.addArrangedSubview($0)
        }
    }
    
    private func setStyle() {
        rankingNumber.font = .pretendard(.bold, size: 19)
        rankingNumber.textColor = .white
        rankingNumber.numberOfLines = 1
        rankingNumber.lineBreakMode = .byClipping
        
        movieImage.contentMode = .scaleAspectFill
        movieImage.layer.cornerRadius = 3
        movieImage.clipsToBounds = true
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 4
        
        titleLabel.font = .pretendard(.regular, size: 10)
        titleLabel.textColor = .white
        subtitleLabel.font = .pretendard(.medium, size: 10)
        subtitleLabel.textColor = .gray2
        ratingLabel.font = .pretendard(.medium, size: 10)
        ratingLabel.textColor = .gray2
    }
    
    
    private func setLayout() {
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        rankingNumber.snp.makeConstraints {
            $0.top.equalTo(movieImage.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(30)
            $0.trailing.equalTo(infoStackView.snp.leading).offset(-10)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(movieImage.snp.bottom).offset(9)
            $0.trailing.equalToSuperview()
        }
        
    }
    
}

extension LiveRankingCollectionViewCell{
    func dataBind(_ itemData: LiveRankingModel){
        rankingNumber.text = String(itemData.ranking)
        movieImage.image = itemData.movieImg
        titleLabel.text = itemData.title
        subtitleLabel.text = itemData.subtitle
        ratingLabel.text = itemData.rating
    }
}
