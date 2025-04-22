//
//  WriteNicknameViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/18/25.
//

import UIKit
import SnapKit
import Then

protocol nickNameDelegate: AnyObject {
    func nickNameBinding(nickName: String)
}

final class WriteNicknameViewController: UIViewController {
    
    weak var delegate: nickNameDelegate?

    //MARK: - UIComponents
    
    private lazy var titleLabel = UILabel().then{
        $0.text = "닉네임을 입력해주세요"
        $0.font = .pretendard(.medium, size: 23)
        $0.textColor = .black
    }
    
    private lazy var nickNameTextField = UITextField().then{
        $0.textColor = .gray4
        $0.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .gray2
        $0.layer.cornerRadius = 3
        $0.addLeftPadding(20)
    }
    
    private lazy var saveButton = UIButton().then{
        $0.backgroundColor = UIColor(named: "Red")
        $0.setTitle("저장하기", for: .normal)
        $0.layer.cornerRadius = 3
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.layer.borderWidth = 0
    }
}

extension WriteNicknameViewController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        addViews()
        setLayout()
    }
    
    //MARK: - Layout
    
    private func addViews(){
        self.view.addSubviews(
            titleLabel,
            nickNameTextField,
            saveButton
        )
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}

