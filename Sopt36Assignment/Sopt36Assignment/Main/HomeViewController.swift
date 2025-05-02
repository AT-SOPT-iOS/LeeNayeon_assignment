//
//  HomeViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/29/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController : UIViewController{
    
    //MARK: - UIComponents
    
    private let homeTableView = UITableView(frame: .zero, style: .plain)
    
    private var headerStackview = UIStackView()
    private var genreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let genreItems = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    private let indicatorView = UIView()
    private let dividerView = UIView()
    
    private var tvingLogoImage = UIImageView()
    private var searchIconImage = UIImageView()
    private var profileIconImage = UIImageView()
    

    //MARK: - Property
    private var selectedIndexPath : Int = 0
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setDelegate()
        
        registerTableViewCell()

        setGenreCollectionViewFlowLayout()
        registerGenreCell()
        
        if indicatorView.frame == .zero {
            DispatchQueue.main.async {
                let initialIndexPath = IndexPath(item: 0, section: 0)
                self.moveIndicator(to: initialIndexPath)
            }
        }
    }
    
    private func setUI(){
        self.view.addSubviews(headerStackview, genreCollectionView, indicatorView, dividerView, homeTableView)
        
        [tvingLogoImage, searchIconImage, profileIconImage].forEach{
            headerStackview.addArrangedSubview($0)
        }
    }
    
    private func setStyle(){
        self.view.backgroundColor = .black
        navigationController?.hidesBarsOnSwipe = true
        
        headerStackview.axis = .horizontal
        headerStackview.distribution = .fill
        headerStackview.alignment = .center
        headerStackview.isLayoutMarginsRelativeArrangement = true
        headerStackview.spacing = 20
        headerStackview.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 11)
        
        tvingLogoImage.image = UIImage(named: "mainTving")
        tvingLogoImage.contentMode = .left
        
        searchIconImage.image = UIImage(named: "search")
        searchIconImage.contentMode = .scaleAspectFit
        
        profileIconImage.image = UIImage(named: "profileImg")
        profileIconImage.contentMode = .scaleAspectFit
        
        genreCollectionView.backgroundColor = .clear
        
        indicatorView.backgroundColor = .white
        
        dividerView.backgroundColor = .gray2
        
        homeTableView.backgroundColor = .black
        homeTableView.separatorStyle = .none
        homeTableView.showsVerticalScrollIndicator = false
    }
    
    private func setLayout(){
        headerStackview.snp.makeConstraints{
            $0.top.equalTo(view).offset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(78)
        }
    
        tvingLogoImage.snp.makeConstraints {
            $0.width.equalTo(191)
        }
        
        [searchIconImage, profileIconImage].forEach{
            $0.snp.makeConstraints {
                $0.size.equalTo(30)
            }
        }
        
        genreCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerStackview.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(genreCollectionView.snp.bottom).offset(10)
            $0.height.equalTo(3)
            $0.width.equalTo(0)
            $0.centerX.equalToSuperview()
        }
        
        moveIndicator(to: IndexPath(item: 0, section: 0))
        
        dividerView.snp.makeConstraints{
            $0.top.equalTo(indicatorView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func setDelegate(){
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    
    // MARK: - Genre Cell
    private func setGenreCollectionViewFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight : CGFloat = 27
        let cellWidth = (screenWidth - 18 - 18 - 28) / 6
        
        flowLayout.itemSize = CGSize(width : cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isScrollEnabled = false
        flowLayout.minimumInteritemSpacing = 28
        self.genreCollectionView.setCollectionViewLayout(flowLayout, animated: false)
        
    }
    
    private func registerGenreCell(){
        genreCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
    }
    
    func moveIndicator(to indexPath: IndexPath){
        guard let cell = genreCollectionView.cellForItem(at: indexPath) else { return }
        let labelWidth = (cell as? GenreCollectionViewCell)?.contentView.frame.width ?? 15
        
        indicatorView.snp.remakeConstraints {
            $0.top.equalTo(genreCollectionView.snp.bottom).offset(10)
            $0.height.equalTo(3)
            $0.width.equalTo(labelWidth)
            $0.centerX.equalTo(cell)
        }
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func registerTableViewCell(){
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        homeTableView.register(DramaTableViewCell.self, forCellReuseIdentifier: DramaTableViewCell.identifier)
        homeTableView.register(EntertainmentTableViewCell.self, forCellReuseIdentifier: EntertainmentTableViewCell.identifier)
        homeTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        homeTableView.register(SportsTableViewCell.self, forCellReuseIdentifier: SportsTableViewCell.identifier)
        homeTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
}


extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(selectedIndexPath) {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTableViewCell.identifier,
                for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
            return cell
            
        case 1 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DramaTableViewCell.identifier,
                for: indexPath) as? DramaTableViewCell else { return UITableViewCell() }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                                    withIdentifier: EntertainmentTableViewCell.identifier,
                                    for: indexPath) as? EntertainmentTableViewCell else { return UITableViewCell() }
            return cell
            
        case 3 :
            guard let cell = tableView.dequeueReusableCell(
                                    withIdentifier: MovieTableViewCell.identifier,
                                    for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
            return cell
            
        case 4 :
            guard let cell = tableView.dequeueReusableCell(
                                    withIdentifier: SportsTableViewCell.identifier,
                                    for: indexPath) as? SportsTableViewCell else { return UITableViewCell() }
            return cell
            
        case 5 :
            guard let cell = tableView.dequeueReusableCell(
                                    withIdentifier: NewsTableViewCell.identifier,
                                    for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.dataBind(genreItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.item
        moveIndicator(to: indexPath)
        homeTableView.reloadData()
    }
    
}


extension HomeViewController : UICollectionViewDelegate{
    
}
