//
//  PdLifeMovieCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class PdLifeMovieCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PdLifeMovieCollectionViewCell"
    
    private lazy var movieImage = UIImageView()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
}

extension PdLifeMovieCollectionViewCell {
    func dataBind(_ itemData : LifeMovieModel) {
        movieImage.image = itemData.movieImage
    }
}
