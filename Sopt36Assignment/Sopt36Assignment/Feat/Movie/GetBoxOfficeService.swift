//
//  GetBoxOffice.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/9/25.
//

import Foundation

final class GetBoxOfficeService{
    static let shared = GetBoxOfficeService()
    private init(){}
    
    func makeRequest(key: String, Date: String) -> URLRequest? {
        var urlString = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        
        urlString += "?key=\(key)&targetDt=\(Date)"
        
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
    func fetchMovieList(key: String, Date: String) async throws -> [BoxOfficeResponseData]{
        guard let request = makeRequest(key: key, Date: Date) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(BoxOfficeTopLevelResponse.self, from: data)
            print(decoded)
            return decoded.boxOfficeResult.dailyBoxOfficeList
        } catch {
            print("디코딩 실패")
            throw NetworkError.responseDecodingError
        }
    }
}
