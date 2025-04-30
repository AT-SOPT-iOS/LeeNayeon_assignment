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
    
    private let baseScrollView = UIScrollView()
    private let scrollContentView = UIView()
    
    private lazy var headerStackview = UIStackView()
    private lazy var tvingLogoImage = UIImageView()
    private lazy var searchIconImage = UIImageView()
    private lazy var profileIconImage = UIImageView()
    
    private var genreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let genreItems = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    private let contentContainerView = UIView()
    
    //MARK: - Property
    private var currentEmbeddedVC: UIViewController?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setDelegate()
        
        setGenreCollectionViewFlowLayout()
        registerGenreCell()
        
        
        let firstIndex = IndexPath(item: 0, section: 0)
        genreCollectionView.selectItem(at: firstIndex, animated: false, scrollPosition: .right)
        changeContentViewController(HomeContentViewController())
    }
    
    private func setUI(){
        self.view.addSubviews(baseScrollView)
        baseScrollView.addSubview(scrollContentView)
        
        [headerStackview, contentContainerView, genreCollectionView].forEach{
            scrollContentView.addSubview($0)
        }
        
        [tvingLogoImage, searchIconImage, profileIconImage].forEach{
            headerStackview.addArrangedSubview($0)
        }
        
        
    }
    
    private func setStyle(){
        self.view.backgroundColor = .black
        
        headerStackview.axis = .horizontal
        headerStackview.distribution = .equalSpacing
        headerStackview.alignment = .fill
        headerStackview.isLayoutMarginsRelativeArrangement = true
        headerStackview.spacing = 10
        headerStackview.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 11)
        
        tvingLogoImage.image = UIImage(named: "mainTving")
        tvingLogoImage.contentMode = .left
        
        searchIconImage.image = UIImage(named: "search")
        searchIconImage.contentMode = .scaleAspectFit
        
        profileIconImage.image = UIImage(named: "profileImg")
        profileIconImage.contentMode = .scaleAspectFit
        
        genreCollectionView.backgroundColor = .clear

    }
    
    private func setLayout(){
        baseScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
        
        scrollContentView.snp.makeConstraints{
            $0.edges.equalTo(baseScrollView.contentLayoutGuide)
            $0.width.equalTo(baseScrollView.frameLayoutGuide)
        }
        
        let heightConstraint = scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        headerStackview.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(50)
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
            $0.top.equalTo(headerStackview.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        contentContainerView.snp.makeConstraints {
            $0.top.equalTo(genreCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate(){
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
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
}
    
   
extension HomeViewController {
    private func changeContentViewController(_ vc : UIViewController){
        if let current = currentEmbeddedVC {
            current.willMove(toParent : nil)
            current.view?.removeFromSuperview()
            current.removeFromParent()
        }
        
        addChild(vc)
        contentContainerView.addSubview(vc.view)
        
        vc.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.greaterThanOrEqualTo(800)
        }
        
        vc.didMove(toParent: self)
        currentEmbeddedVC = vc
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView === genreCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else {
                return GenreCollectionViewCell()
            }
            
            cell.dataBind(genreItems[indexPath.item])
            return cell
            
        }
    
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView === genreCollectionView {
            return genreItems.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC : UIViewController
        
        switch indexPath.item {
        case 0:
            destinationVC = HomeContentViewController()
        case 1 :
            destinationVC = DramaViewController()
        case 2:
            destinationVC = EntertainmentViewController()
        case 3:
            destinationVC = MovieViewController()
        case 4:
            destinationVC = SportsViewController()
        default:
            destinationVC = UIViewController()
        }
        
        changeContentViewController(destinationVC)
    }
}

extension HomeViewController: UICollectionViewDelegate{
    
}

