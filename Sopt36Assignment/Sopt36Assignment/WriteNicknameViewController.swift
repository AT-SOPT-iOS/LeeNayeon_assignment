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
        $0.addTarget(self, action: #selector(nickNameTextFieldDidChange), for: .editingChanged)
        $0.addTarget(self, action: #selector(enableSaveButton), for: .editingChanged)
    }
    
    private lazy var saveButton = UIButton().then{
        $0.isEnabled = false
        $0.backgroundColor = .clear
        $0.setTitleColor(.gray4, for: .normal)
        $0.setTitle("저장하기", for: .normal)
        $0.layer.cornerRadius = 3
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.layer.borderWidth = 1
        $0.addTarget(self, action: #selector(saveNickName), for: .touchUpInside)
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
    
    //MARK: - save nickanme
    
    @objc
    func saveNickName(){
        delegate?.nickNameBinding(nickName: nickNameTextField.text ?? "")
        self.dismiss(animated: true)
    }
    
    @objc
    func enableSaveButton(){
        if nickNameTextField.hasText{
            saveButton.disableToEnableButton()
        }
        else{
            saveButton.enableToDisableButton()
        }
    }
    
    //MARK: - valid check
    @objc
    func nickNameTextFieldDidChange(_ textField: UITextField){
        let name = nickNameTextField.text ?? ""
        
        if !name.isValidNickname(){
            let invalidAlert = UIAlertController(title: "올바르지 않은 형식", message: "닉네임은 한글로 구성해주세요", preferredStyle: UIAlertController.Style.alert)
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            invalidAlert.addAction(confirm)
            present(invalidAlert, animated: true , completion: nil)
        }
    }
    

}

