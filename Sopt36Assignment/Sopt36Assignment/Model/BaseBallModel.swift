//
//  BaseBallModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct BaseBallModel {
    let groupImage : UIImage
}

extension BaseBallModel {
    static func dummy() -> [BaseBallModel] {
        return[
            BaseBallModel(groupImage: .baseball1),
            BaseBallModel(groupImage: .baseball2),
            BaseBallModel(groupImage: .baseball3),
            BaseBallModel(groupImage: .baseball4),
            BaseBallModel(groupImage: .baseball5),
            BaseBallModel(groupImage: .baseball6),
            BaseBallModel(groupImage: .baseball7),
            BaseBallModel(groupImage: .baseball8),
            BaseBallModel(groupImage: .baseball9),
            BaseBallModel(groupImage: .baseball10)
            
        ]
    }
}
