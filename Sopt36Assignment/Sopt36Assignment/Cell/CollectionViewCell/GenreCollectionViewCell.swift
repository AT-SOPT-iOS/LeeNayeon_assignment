//
//  GenreCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/30/25.
//

import UIKit
import SnapKit

class GenreCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "GenreCollectionViewCell"
    
    private var genreLabel = UILabel()
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    private func setUI(){
        contentView.addSubview(genreLabel)
        
        genreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    private func setStyle(){
        genreLabel.font = .pretendard(.regular, size: 17)
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
    }

    
}

extension GenreCollectionViewCell {
    func dataBind(_ itemData : String){
        genreLabel.text = itemData
    }

}

