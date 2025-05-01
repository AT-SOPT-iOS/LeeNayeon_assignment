//
//  SportsRelayModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct SportsRelayModel {
   let relayImage : UIImage
}

extension SportsRelayModel {
    static func dummy() -> [SportsRelayModel] {
        return [
            SportsRelayModel(relayImage: .appleTVimg),
            SportsRelayModel(relayImage: .kboImg),
            SportsRelayModel(relayImage: .kblImg),
            SportsRelayModel(relayImage: .afcImg)
        ]
    }
}
