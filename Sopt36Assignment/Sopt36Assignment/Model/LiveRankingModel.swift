//
//  LiveRankingModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct LiveRankingModel{
    let movieImg : UIImage
    let ranking : Int
    let title : String
    let subtitle : String
    let rating : String
}

extension LiveRankingModel {
    static func dummy() -> [LiveRankingModel] {
        return[
            LiveRankingModel(movieImg: .poster1, ranking: 1, title: "별들에게 물어봐", subtitle: "13화", rating: "5%"),
            LiveRankingModel(movieImg: .poster2, ranking: 2, title: "선재업고 튀어", subtitle: "5화", rating: "12%"),
            LiveRankingModel(movieImg: .poster3, ranking: 3, title: "환승연애", subtitle: "8화", rating: "14.4%"),
            LiveRankingModel(movieImg: .poster4, ranking: 4, title: "뿅뿅지구오락실", subtitle: "9화", rating: "7.9%"),
            LiveRankingModel(movieImg: .poster5, ranking: 5, title: "언젠가는 슬기로울 전공의 생활", subtitle: "2화", rating: "10%"),
            LiveRankingModel(movieImg: .poster6, ranking: 6, title: "이혼보험", subtitle: "3화", rating: "8.8%"),
            LiveRankingModel(movieImg: .poster1, ranking: 7, title: "별들에게 물어봐", subtitle: "13화", rating: "5%"),
            LiveRankingModel(movieImg: .poster2, ranking: 8, title: "선재업고 튀어", subtitle: "5화", rating: "12%"),
            LiveRankingModel(movieImg: .poster3, ranking: 9, title: "환승연애", subtitle: "8화", rating: "14.4%"),
            LiveRankingModel(movieImg: .poster4, ranking: 10, title: "뿅뿅지구오락실", subtitle: "9화", rating: "7.9%"),
        ]
    }
}
