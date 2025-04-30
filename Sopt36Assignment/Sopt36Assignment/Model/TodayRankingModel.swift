//
//  TodayRankingModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct TodayRankingModel {
    let movieImg : UIImage
    let ranking : Int
}

extension TodayRankingModel {
    static func dummy() -> [TodayRankingModel] {
        return [
            TodayRankingModel(movieImg: .mainMovie1, ranking: 1),
            TodayRankingModel(movieImg: .mainMovie2, ranking: 2),
            TodayRankingModel(movieImg: .mainMovie3, ranking: 3),
            TodayRankingModel(movieImg: .mainMovie4, ranking: 4),
            TodayRankingModel(movieImg: .mainMovie1, ranking: 5),
            TodayRankingModel(movieImg: .mainMovie2, ranking: 6),
            TodayRankingModel(movieImg: .mainMovie3, ranking: 7),
            TodayRankingModel(movieImg: .mainMovie4, ranking: 8),
            TodayRankingModel(movieImg: .mainMovie1, ranking: 9),
            TodayRankingModel(movieImg: .mainMovie2, ranking: 10),
            TodayRankingModel(movieImg: .mainMovie3, ranking: 11),
            TodayRankingModel(movieImg: .mainMovie4, ranking: 12),
            TodayRankingModel(movieImg: .mainMovie1, ranking: 13),
            TodayRankingModel(movieImg: .mainMovie2, ranking: 14),
            TodayRankingModel(movieImg: .mainMovie3, ranking: 15),
            TodayRankingModel(movieImg: .mainMovie4, ranking: 16),
            TodayRankingModel(movieImg: .mainMovie1, ranking: 17),
            TodayRankingModel(movieImg: .mainMovie2, ranking: 18),
            TodayRankingModel(movieImg: .mainMovie3, ranking: 19),
            TodayRankingModel(movieImg: .mainMovie4, ranking: 20)
        ]
    }
}
