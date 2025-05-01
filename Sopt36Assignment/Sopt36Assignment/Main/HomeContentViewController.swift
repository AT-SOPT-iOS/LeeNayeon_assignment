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
    
    private let todayRankingLabel = HomeTitleLabel()
    private let todayRankingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let liveRankingStackView = UIStackView()
    private let liveRankingLabel = HomeTitleLabel()
    private let liveRankingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let liveRanknigMoreButton = MoreButton()
    
    private let liveMovieRankingStackView = UIStackView()
    private let liveMovieRankingLabel = HomeTitleLabel()
    private let liveMovieRanknigMoreButton = MoreButton()
    private let liveMovieRankingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let baseBallCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let sportsListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let pdLifeMovieLabel = HomeTitleLabel()
    private let pdLifeMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var notificationStackView = UIStackView()
    private lazy var notificationLabel = UILabel()
    private lazy var notificationTitleLabel = UILabel()
    private lazy var goButton = UIButton()
    
    private lazy var infoStackView = UIStackView()
    private lazy var infoTopStackView = UIStackView()
    private lazy var infoBottomStackView = UIStackView()
    
    private lazy var topInfoLabels: [InfoLabel] = [
        InfoLabel(text: "고객문의"),
        InfoLabel(text: "·"),
        InfoLabel(text: "이용약관"),
        InfoLabel(text: "·"),
        InfoLabel(text: "개인정보처리방침", textColor: .white)
    ]
    
    private lazy var bottomInfoLabels: [InfoLabel] = [
        InfoLabel(text: "사업자정보"),
        InfoLabel(text: "·"),
        InfoLabel(text: "인재채용")
    ]
    
    //MARK: - Property
    private let movieRankingList = MovieRankingModel.dummy()
    private let liveRankingList = LiveRankingModel.dummy()
    private let baseBallList = BaseBallModel.dummy()
    private let sportsList = SportsRelayModel.dummy()
    private let lifeMovieList = LifeMovieModel.dummy()

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setStyle()
        setDelegate()
        setCollectionViewFlowLayout()
        registerCollectionViewCell()
        
    }
    
    private func setUI(){
        self.view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        
        [liveRankingLabel, liveRanknigMoreButton].forEach {
            liveRankingStackView.addArrangedSubview($0)
        }
        
        [liveMovieRankingLabel, liveMovieRanknigMoreButton].forEach {
            liveMovieRankingStackView.addArrangedSubview($0)
        }
        
        [notificationLabel, notificationTitleLabel, goButton].forEach {
            notificationStackView.addArrangedSubview($0)
        }
        
        topInfoLabels.forEach{
            infoTopStackView.addArrangedSubview($0)
        }
        
        bottomInfoLabels.forEach{
            infoBottomStackView.addArrangedSubview($0)
        }

        [infoTopStackView, infoBottomStackView].forEach {
            infoStackView.addArrangedSubview($0)
        }
        
        [mainMovieImgae, todayRankingLabel, todayRankingCollectionView, liveRankingStackView, liveRankingCollectionView, liveMovieRankingStackView, liveMovieRankingCollectionView, baseBallCollectionView, sportsListCollectionView, pdLifeMovieLabel, pdLifeMovieCollectionView, notificationStackView, infoStackView].forEach{
            contentView.addSubview($0)
        }
        
    }

    private func setStyle(){
        scrollView.isScrollEnabled = true
        
        mainMovieImgae.image = UIImage(named: "mainPoster")
        mainMovieImgae.contentMode = .scaleAspectFill
        mainMovieImgae.clipsToBounds = true
        
        todayRankingLabel.text = "오늘의 티빙 TOP 20"
        
        liveRankingStackView.axis = .horizontal
        liveRankingStackView.spacing = 0
        liveRankingLabel.text = "실시간 인기 LIVE"
        
        liveMovieRankingStackView.axis = .horizontal
        liveMovieRankingStackView.spacing = 0
        liveMovieRankingLabel.text = "실시간 인기 영화"
        
        pdLifeMovieLabel.text = "김가현PD의 인생작 TOP 5"
        
        todayRankingCollectionView.backgroundColor = .clear
        liveRankingCollectionView.backgroundColor = .clear
        liveMovieRankingCollectionView.backgroundColor = .clear
        baseBallCollectionView.backgroundColor = .clear
        sportsListCollectionView.backgroundColor = .clear
        pdLifeMovieCollectionView.backgroundColor = .clear
        
        notificationStackView.axis = .horizontal
        notificationStackView.backgroundColor = .gray4
        notificationStackView.spacing = 0
        notificationStackView.layer.cornerRadius = 3
        notificationStackView.isLayoutMarginsRelativeArrangement = true
        notificationStackView.layoutMargins = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 20)
        
        notificationLabel.text = "공지"
        notificationLabel.textColor = .gray2
        notificationLabel.font = .pretendard(.medium, size: 11)
        
        notificationTitleLabel.text = "티빙 계정 공유 정책 추가 안내"
        notificationTitleLabel.textColor = .white
        notificationTitleLabel.font = .pretendard(.medium, size: 11)
        
        goButton.setImage(.btnForward, for: .normal)
        
        infoStackView.axis = .vertical
        infoStackView.alignment = .leading
        
        infoTopStackView.axis = .horizontal
        infoTopStackView.alignment = .center
        infoTopStackView.distribution = .fill
        infoTopStackView.setContentHuggingPriority(.required, for: .horizontal)
        
        infoBottomStackView.axis = .horizontal
        infoBottomStackView.alignment = .center
        infoBottomStackView.distribution = .fill
        infoBottomStackView.setContentHuggingPriority(.required, for: .horizontal)
        
        infoStackView.spacing = 1
        infoTopStackView.spacing = 2
        infoBottomStackView.spacing = 2
        
    }
    
    private func setLayout(){
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.bottom.equalTo(infoStackView.snp.bottom).offset(200)
        }
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        mainMovieImgae.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        todayRankingLabel.snp.makeConstraints {
            $0.top.equalTo(mainMovieImgae.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(12)
        }
        
        todayRankingCollectionView.snp.makeConstraints {
            $0.top.equalTo(todayRankingLabel.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        
        liveRankingStackView.snp.makeConstraints{
            $0.top.equalTo(todayRankingCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        liveRankingLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        liveRanknigMoreButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        
        liveRankingCollectionView.snp.makeConstraints{
            $0.top.equalTo(liveRankingStackView.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(200)
        }
        
        liveMovieRankingStackView.snp.makeConstraints{
            $0.top.equalTo(liveRankingCollectionView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        liveMovieRankingLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        liveMovieRanknigMoreButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        
        liveMovieRankingCollectionView.snp.makeConstraints{
            $0.top.equalTo(liveMovieRankingStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(200)
        }
        
        baseBallCollectionView.snp.makeConstraints {
            $0.top.equalTo(liveMovieRankingCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        sportsListCollectionView.snp.makeConstraints {
            $0.top.equalTo(baseBallCollectionView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(45)
        }
        
        pdLifeMovieLabel.snp.makeConstraints {
            $0.top.equalTo(sportsListCollectionView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        pdLifeMovieCollectionView.snp.makeConstraints{
            $0.top.equalTo(pdLifeMovieLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(90)
        }
        
        notificationStackView.snp.makeConstraints {
            $0.top.equalTo(pdLifeMovieCollectionView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(50)
        }
        
        notificationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(notificationTitleLabel.snp.leading).offset(-10)
        }
        
        notificationTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        
        goButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(notificationStackView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        

    }
    
    private func setDelegate(){
        todayRankingCollectionView.delegate = self
        todayRankingCollectionView.dataSource = self
        
        liveRankingCollectionView.delegate = self
        liveRankingCollectionView.dataSource = self
        
        liveMovieRankingCollectionView.delegate = self
        liveMovieRankingCollectionView.dataSource = self
        
        baseBallCollectionView.delegate = self
        baseBallCollectionView.dataSource = self
        
        sportsListCollectionView.delegate = self
        sportsListCollectionView.dataSource = self
        
        pdLifeMovieCollectionView.delegate = self
        pdLifeMovieCollectionView.dataSource = self
    }
    
    private func setCollectionViewFlowLayout(){
        todayRankingSetFlowLayout()
        liveRankingSetFlowLayout()
        liveMovieRankingSetFlowLayout()
        baseBallSetFlowLayout()
        sportsListSetFlowLayout()
        lifeMovieSetFlowLayout()
    }
    
    private func registerCollectionViewCell(){
        registerTodayRankingCell()
        registerLiveRankingCell()
        registerLiveMovieRankingCell()
        registerBaseBallCell()
        registerSportsListCell()
        registerLifeMovieCell()
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
        self.todayRankingCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerTodayRankingCell(){
        todayRankingCollectionView.register(RankingCollectionViewCell.self, forCellWithReuseIdentifier: RankingCollectionViewCell.identifier)
    }
    
    //MARK: - Live Ranking Cell
    private func liveRankingSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 160
        let visibleItems: CGFloat = 2.3
        let spacing: CGFloat = 3
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.liveRankingCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerLiveRankingCell(){
        liveRankingCollectionView.register(LiveRankingCollectionViewCell.self, forCellWithReuseIdentifier: LiveRankingCollectionViewCell.identifier)
    }
    
    //MARK: - Live Movie Ranking Cell
    private func liveMovieRankingSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 146
        let visibleItems: CGFloat = 3.5
        let spacing: CGFloat = 3
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.liveMovieRankingCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        
    }
    
    private func registerLiveMovieRankingCell(){
        liveMovieRankingCollectionView.register(LiveMovieRankingCollectionViewCell.self, forCellWithReuseIdentifier: LiveMovieRankingCollectionViewCell.identifier)
    }
    
    //MARK: - Baseball Cell
    private func baseBallSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 50
        let visibleItems: CGFloat = 4.7
        let spacing: CGFloat = 3
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.baseBallCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerBaseBallCell(){
        baseBallCollectionView.register(BaseBallCollectionViewCell.self, forCellWithReuseIdentifier: BaseBallCollectionViewCell.identifier)
    }
    
    //MARK: - Sports Relay Cell
    private func sportsListSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 45
        let visibleItems: CGFloat = 3.7
        let spacing: CGFloat = 3
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.sportsListCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerSportsListCell(){
        sportsListCollectionView.register(SportsListCollectionViewCell.self, forCellWithReuseIdentifier: SportsListCollectionViewCell.identifier)
    }
    
    //MARK: - Life Movie Cell
    private func lifeMovieSetFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight: CGFloat = 90
        let visibleItems: CGFloat = 2.3
        let spacing: CGFloat = 15
        let totalSpacing = spacing * (visibleItems - 1)
        let cellWidth = (screenWidth - totalSpacing) / visibleItems
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = true
        flowLayout.collectionView?.showsVerticalScrollIndicator = false
        flowLayout.minimumLineSpacing = spacing
        self.pdLifeMovieCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func registerLifeMovieCell(){
        pdLifeMovieCollectionView.register(PdLifeMovieCollectionViewCell.self, forCellWithReuseIdentifier: PdLifeMovieCollectionViewCell.identifier)
    }
}

extension HomeContentViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch(collectionView){
        case todayRankingCollectionView :
            return movieRankingList.count
        case liveRankingCollectionView:
            return liveRankingList.count
        case liveMovieRankingCollectionView:
            return movieRankingList.count
        case baseBallCollectionView :
            return baseBallList.count
        case sportsListCollectionView :
            return sportsList.count
        case pdLifeMovieCollectionView :
            return lifeMovieList.count
        default:
            return 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch(collectionView){
        case todayRankingCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else {
                return RankingCollectionViewCell()
            }
            
            cell.dataBind(movieRankingList[indexPath.item])
            return cell
        case liveRankingCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveRankingCollectionViewCell.identifier, for: indexPath) as? LiveRankingCollectionViewCell else {
                return LiveRankingCollectionViewCell()
            }
            
            cell.dataBind(liveRankingList[indexPath.item])
            return cell
            
        case liveMovieRankingCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveMovieRankingCollectionViewCell.identifier, for: indexPath) as? LiveMovieRankingCollectionViewCell else {
                return LiveMovieRankingCollectionViewCell()
            }
            
            cell.dataBind(movieRankingList[indexPath.item])
            return cell
            
        case baseBallCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseBallCollectionViewCell.identifier, for: indexPath) as? BaseBallCollectionViewCell else {
                return BaseBallCollectionViewCell()
            }
            
            cell.dataBind(baseBallList[indexPath.item])
            
            if indexPath.item % 2 == 0 {
                cell.backgroundColor = .white
            } else {
                cell.backgroundColor = .clear
            }
            return cell
            
        case sportsListCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportsListCollectionViewCell.identifier, for: indexPath) as? SportsListCollectionViewCell else {
                return SportsListCollectionViewCell()
            }
            
            cell.dataBind(sportsList[indexPath.item])
            return cell
            
        case pdLifeMovieCollectionView :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PdLifeMovieCollectionViewCell.identifier, for: indexPath) as? PdLifeMovieCollectionViewCell else {
                return PdLifeMovieCollectionViewCell()
            }
            
            cell.dataBind(lifeMovieList[indexPath.item])
            return cell
            
        default:
            return UICollectionViewCell()
        
        }
    }
}

extension HomeContentViewController : UICollectionViewDelegate {
    
}
