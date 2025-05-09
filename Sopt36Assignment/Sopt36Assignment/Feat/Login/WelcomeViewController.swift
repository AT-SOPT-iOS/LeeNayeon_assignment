//
//  WelcomeViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/18/25.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    var nameText: String?
    
    //MARK: - UIComponent
    private lazy var tvingImg = UIImageView().then{
        $0.image = .tvingImg
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var welcomeLabel = UILabel().then{
        guard let nameText else { return }
        $0.text = "\(nameText)님\n반가워요!"
        
        $0.font = .pretendard(.bold, size: 23)
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.setLineSpacingAndAlignment(spacing: 16.0, alignment: .center)
    }
    
    private lazy var goMainButton = UIButton().then{
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "Red")
        $0.layer.cornerRadius = 3
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.layer.borderWidth = 0
    }
}

extension WelcomeViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black

        setUI()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Layout
    
    private func setUI(){
        self.view.addSubviews(
            tvingImg,
            welcomeLabel,
            goMainButton
        )
    }
    
    private func setLayout(){
        tvingImg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(58)
        }
        
        welcomeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tvingImg.snp.bottom).offset(67)
        }
        
        goMainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-66)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
}
