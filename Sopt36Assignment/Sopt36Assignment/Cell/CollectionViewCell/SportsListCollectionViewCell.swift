//
//  SportsListCollectionViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

class SportsListCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SportsListCollectionViewCell"
    
    private var relayImage = UIImageView()
    
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
        contentView.addSubview(relayImage)
    }
    
    private func setStyle(){
        relayImage.backgroundColor = .gray4
        relayImage.contentMode = .scaleAspectFit
        relayImage.clipsToBounds = true
        relayImage.layer.cornerRadius = 4
    }
    
    private func setLayout(){
        relayImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(45)
        }
    }
}

extension SportsListCollectionViewCell {
    func dataBind(_ itemData: SportsRelayModel){
        relayImage.image = itemData.relayImage
    }
}
