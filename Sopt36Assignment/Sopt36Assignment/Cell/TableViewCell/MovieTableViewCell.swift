//
//  MovieTableViewCell.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 5/3/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieViewCell"

    private let titleLabel = UILabel()
    private let boxOfficeTableView = UITableView(frame: .zero, style: .plain)
    
    private var boxOfficeList: [BoxOfficeResponseData] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
        setDelegate()
        getDailyBoxOffice()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.contentView.addSubviews(titleLabel, boxOfficeTableView)
    }
    
    private func setStyle(){
        contentView.backgroundColor = .black
        
        titleLabel.text = "일간별 박스오피스 순위 TOP10"
        titleLabel.textColor = .white
        titleLabel.font = .pretendard(.bold, size: 20)
        
        boxOfficeTableView.backgroundColor = .black
    }
    
    private func setDelegate(){
        boxOfficeTableView.delegate = self
        boxOfficeTableView.dataSource = self
        boxOfficeTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(15)
        }
        
        boxOfficeTableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1500)
        }
    }
    
    @objc
    private func getDailyBoxOffice(){
        Task {
            do {
                let result = try await GetBoxOfficeService.shared.fetchMovieList(
                    key: API_KEY,
                    Date: getYesterdayDate()
                    )
                self.boxOfficeList = result
                DispatchQueue.main.async {
                    self.boxOfficeTableView.reloadData()
                }
                
            } catch {
                print("데이터 가져오기 실패", error)
            }
        }
    }
    
    @objc
    private func getYesterdayDate() -> String{
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: yesterday)
    }
}

extension MovieTableViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BoxOfficeTableViewCell.identifier,
            for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell() }
        cell.dataBind(with: boxOfficeList[indexPath.row])
        return cell
    }
}

extension MovieTableViewCell : UITableViewDelegate {

}
