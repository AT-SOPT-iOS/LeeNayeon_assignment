//
//  RankingCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class RankingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "RankingCollectionViewCell"
    
    private lazy var rankingNumber = UILabel()
    private lazy var movieImage = UIImageView()
    
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
        [rankingNumber, movieImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setStyle(){
        rankingNumber.font = .pretendard(.semiBold, size: 50).italic
        rankingNumber.textAlignment = .right
        rankingNumber.textColor = .white
        rankingNumber.numberOfLines = 1
        rankingNumber.lineBreakMode = .byClipping
        
        movieImage.contentMode = .scaleAspectFill
    }
    
    private func setLayout(){
        rankingNumber.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(80)
        }
        
        movieImage.snp.makeConstraints {
            $0.leading.equalTo(rankingNumber.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension RankingCollectionViewCell {
    func dataBind(_ itemData: MovieRankingModel){
        rankingNumber.text = String(itemData.ranking)
        movieImage.image = itemData.movieImg
    }
}
