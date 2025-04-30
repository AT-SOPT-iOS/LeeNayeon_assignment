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
    private let indicatorView = UIView()
    
    private var indicatorWidthConstraint: Constraint?
    
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
        [genreLabel, indicatorView].forEach {
            contentView.addSubview($0)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(7)
            indicatorWidthConstraint = $0.width.equalTo(0).constraint
            $0.height.equalTo(3)
            $0.centerX.equalTo(genreLabel.snp.centerX)
        }
    }
    
    private func setStyle(){
        genreLabel.font = .pretendard(.regular, size: 17)
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
        
        indicatorView.backgroundColor = .white
    }
    
    override var isSelected: Bool {
        didSet{
            indicatorView.isHidden = !isSelected
            if isSelected {
                let width = genreLabel.intrinsicContentSize.width
                indicatorWidthConstraint?.update(offset: width)
            }
        }
    }
    
}

extension GenreCollectionViewCell {
    func dataBind(_ itemData : String){
        genreLabel.text = itemData
    }
}

