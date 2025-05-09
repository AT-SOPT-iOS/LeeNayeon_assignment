//
//  BoxOfficeResponseModel.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/9/25.
//

struct BoxOfficeTopLevelResponse: Codable {
    let boxOfficeResult: BoxOfficeResponseWrapper
}

struct BoxOfficeResponseWrapper: Codable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOfficeResponseData]
}

struct BoxOfficeResponseData: Codable {
    let rnum: String
    let rank: String
    let movieNm: String
    let openDt: String
    let audiAcc: String
}
