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
    
    private lazy var headerStackview = UIStackView()
    private lazy var tvingLogoImage = UIImageView()
    private lazy var searchIconImage = UIImageView()
    private lazy var profileIconImage = UIImageView()
    
    private var currentEmbeddedVC: UIViewController?

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setDelegate()
        
        registerHomeTableViewCell()
        
    }
    
    private func setUI(){
        self.view.addSubviews(headerStackview, homeTableView)
        
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
        
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none
        homeTableView.showsVerticalScrollIndicator = false
    }
    
    private func setLayout(){
        headerStackview.snp.makeConstraints{
            $0.top.equalTo(view).offset(50)
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
        
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(headerStackview.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

    }
    
    private func setDelegate(){
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    

    private func registerHomeTableViewCell(){
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}


extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                                withIdentifier: HomeTableViewCell.identifier,
                                for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        return cell
    }
}
