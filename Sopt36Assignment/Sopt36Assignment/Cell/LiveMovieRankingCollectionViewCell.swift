//
//  LiveMovieRankingCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class LiveMovieRankingCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "LiveMovieRankingCollectionViewCell"
    
    private var movieImage = UIImageView()
    
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
        contentView.addSubview(movieImage)
    }
    
    private func setStyle(){
        movieImage.contentMode = .scaleAspectFill
        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = 3
    }
    
    private func setLayout() {
        movieImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension LiveMovieRankingCollectionViewCell {
    func dataBind(_ itemData : MovieRankingModel){
        movieImage.image = itemData.movieImg
    }
}
