//
//  TodayRankingModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct MovieRankingModel {
    let movieImg : UIImage
    let ranking : Int
}

extension MovieRankingModel {
    static func dummy() -> [MovieRankingModel] {
        return [
            MovieRankingModel(movieImg: .movie1, ranking: 1),
            MovieRankingModel(movieImg: .movie2, ranking: 2),
            MovieRankingModel(movieImg: .movie3, ranking: 3),
            MovieRankingModel(movieImg: .movie4, ranking: 4),
            MovieRankingModel(movieImg: .movie5, ranking: 5),
            MovieRankingModel(movieImg: .movie6, ranking: 6),
            MovieRankingModel(movieImg: .movie7, ranking: 7),
            MovieRankingModel(movieImg: .movie8, ranking: 8),
            MovieRankingModel(movieImg: .movie9, ranking: 9),
            MovieRankingModel(movieImg: .movie10, ranking: 10),
            MovieRankingModel(movieImg: .movie11, ranking: 11),
            MovieRankingModel(movieImg: .movie12, ranking: 12),
            MovieRankingModel(movieImg: .movie1, ranking: 13),
            MovieRankingModel(movieImg: .movie2, ranking: 14),
            MovieRankingModel(movieImg: .movie3, ranking: 15),
            MovieRankingModel(movieImg: .movie4, ranking: 16),
            MovieRankingModel(movieImg: .movie5, ranking: 17),
            MovieRankingModel(movieImg: .movie6, ranking: 18),
            MovieRankingModel(movieImg: .movie7, ranking: 19),
            MovieRankingModel(movieImg: .movie8, ranking: 20)
        ]
    }
}
