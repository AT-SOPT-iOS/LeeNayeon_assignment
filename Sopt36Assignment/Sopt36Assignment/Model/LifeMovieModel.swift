//
//  LifeMovieModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/1/25.
//

import UIKit

struct LifeMovieModel {
    let movieImage : UIImage
}

extension LifeMovieModel {
    static func dummy() -> [LifeMovieModel] {
        return [
            LifeMovieModel(movieImage: .poster4),
            LifeMovieModel(movieImage: .poster5),
            LifeMovieModel(movieImage: .poster6),
            LifeMovieModel(movieImage: .poster3),
            LifeMovieModel(movieImage: .poster2)
        ]
    }
}
