//
//  BaseBallCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class BaseBallCollectionViewCell: UICollectionViewCell {
    static let identifier : String = "BaseBallCollectionViewCell"
    
    private lazy var groupImage = UIImageView()
    
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
    
    private func setUI(){
        contentView.addSubview(groupImage)
    }
    
    private func setStyle(){
        groupImage.contentMode = .scaleAspectFit
        groupImage.clipsToBounds = true
    }
    
    private func setLayout(){
        groupImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
}

extension BaseBallCollectionViewCell {
    func dataBind(_ itemData : BaseBallModel){
        groupImage.image = itemData.groupImage
    }
}
