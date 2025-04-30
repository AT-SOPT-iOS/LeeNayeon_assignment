//
//  HomeContentViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/30/25.
//

import UIKit

import SnapKit

final class HomeContentViewController : UIViewController{
    
    //MARK: - UIComponents
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainMovieImgae = UIImageView()
    
    private let todayRanking = UILabel()
    private let rankingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK: - Property
    private let todayRankingList = TodayRankingModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setStyle()
        setDelegate()
        
        todayRankingSetFlowLayout()
        registerTodayRankingCell()
    }
    
    private func setUI(){
        self.view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        [mainMovieImgae, todayRanking, rankingCollectionView].forEach{
            contentView.addSubview($0)
        }
    }

    private func setStyle(){
        mainMovieImgae.image = UIImage(named: "mainPoster")
        mainMovieImgae.contentMode = .scaleAspectFill
        mainMovieImgae.clipsToBounds = true
        
        todayRanking.text = "오늘의 티빙 TOP 20"
        todayRanking.font = .pretendard(.bold, size: 15)
        todayRanking.textColor = .white
        
        rankingCollectionView.backgroundColor = .clear
    }
    
    private func setLayout(){
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        mainMovieImgae.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        todayRanking.snp.makeConstraints {
            $0.top.equalTo(mainMovieImgae.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(12)
        }
        
        rankingCollectionView.snp.makeConstraints {
            $0.top.equalTo(todayRanking.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setDelegate(){
        rankingCollectionView.delegate = self
        rankingCollectionView.dataSource = self
    }
    
    
    //MARK: - Today Ranking Cell
    private func todayRankingSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 146
        let visibleItems: CGFloat = 2.3
        let spacing: CGFloat = 12
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.rankingCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerTodayRankingCell(){
        rankingCollectionView.register(RankingCollectionViewCell.self, forCellWithReuseIdentifier: RankingCollectionViewCell.identifier)
    }
    
    
}

extension HomeContentViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === rankingCollectionView {
            return todayRankingList.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === rankingCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else {
                return RankingCollectionViewCell()
            }
            
            cell.dataBind(todayRankingList[indexPath.item])
            return cell
        }

        return UICollectionViewCell()
        
        
    }
    
    
}

extension HomeContentViewController : UICollectionViewDelegate {
    
}
