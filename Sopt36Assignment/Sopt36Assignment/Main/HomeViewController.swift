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
    
    private let indicatorView = UIView()
    
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
        
        let initialIndexPath = IndexPath(item: 0, section: 0)
        genreCollectionView.selectItem(at: initialIndexPath, animated: false, scrollPosition: [])
        
        collectionView(genreCollectionView, didSelectItemAt: initialIndexPath)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if indicatorView.frame == .zero {
                DispatchQueue.main.async {
                    let initialIndexPath = IndexPath(item: 0, section: 0)
                    self.moveIndicator(to: initialIndexPath)
                }
            }
    }
    private func setUI(){
        self.view.addSubviews(baseScrollView)
        baseScrollView.addSubview(scrollContentView)
        
        [headerStackview, genreCollectionView, indicatorView, contentContainerView].forEach{
            scrollContentView.addSubview($0)
        }
        
        [tvingLogoImage, searchIconImage, profileIconImage].forEach{
            headerStackview.addArrangedSubview($0)
        }
        
        
    }
    
    private func setStyle(){
        self.view.backgroundColor = .black
        navigationController?.hidesBarsOnSwipe = true
        
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
        
        indicatorView.backgroundColor = .white
    }
    
    private func setLayout(){
        baseScrollView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        scrollContentView.snp.makeConstraints{
            $0.edges.equalTo(baseScrollView.contentLayoutGuide)
            $0.width.equalTo(baseScrollView.frameLayoutGuide)
            $0.bottom.equalTo(contentContainerView.snp.bottom)
        }
        
        let heightConstraint = scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        headerStackview.snp.makeConstraints{
            $0.top.equalTo(baseScrollView.contentLayoutGuide.snp.top)
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
        
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(genreCollectionView.snp.bottom).offset(10)
            $0.height.equalTo(3)
            $0.width.equalTo(0)
            $0.centerX.equalToSuperview()
        }
        
        moveIndicator(to: IndexPath(item: 0, section: 0))
        
        contentContainerView.snp.makeConstraints {
            $0.top.equalTo(genreCollectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(baseScrollView.contentLayoutGuide)
            $0.bottom.equalTo(baseScrollView.contentLayoutGuide)
            $0.width.equalTo(baseScrollView.frameLayoutGuide)
        }
    }
    
    private func setDelegate(){
        baseScrollView.delegate = self
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
            $0.height.greaterThanOrEqualTo(1500)
        }
        
        vc.didMove(toParent: self)
        currentEmbeddedVC = vc
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerHeight = headerStackview.frame.height
        let distanceFromOrigin = abs(scrollView.contentOffset.y)
        let isPulledDown = scrollView.contentOffset.y <= -headerHeight
        let stopExpanHeader = scrollView.contentOffset.y <= -(headerHeight*2)
        
        print(scrollView.contentOffset.y)
        if !stopExpanHeader && isPulledDown {
            headerStackview.snp.updateConstraints{ make in
                make.height.equalTo(distanceFromOrigin)
            }
            headerStackview.alpha = 1
        }
        else if !isPulledDown {
            let height = scrollView.contentOffset.y <= 0 ? distanceFromOrigin : 0
            headerStackview.snp.updateConstraints { (make) in
                make.height.equalTo(height)
            }
            
            headerStackview.alpha = distanceFromOrigin / headerHeight
            
        }
    }
    
    func moveIndicator(to indexPath: IndexPath){
        guard let cell = genreCollectionView.cellForItem(at: indexPath) else { return }
        let labelWidth = (cell as? GenreCollectionViewCell)?.contentView.frame.width ?? 30
        
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
        case 5:
            destinationVC = NewsViewController()
        default:
            destinationVC = UIViewController()
        }
        
        moveIndicator(to: indexPath)
        changeContentViewController(destinationVC)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        moveIndicator(to: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = genreItems[indexPath.item]
            .size(withAttributes: [.font: UIFont.pretendard(.regular, size: 17)]).width + 20
        return CGSize(width: width, height: 40)
    }
}

extension HomeViewController: UICollectionViewDelegate{
    
}


