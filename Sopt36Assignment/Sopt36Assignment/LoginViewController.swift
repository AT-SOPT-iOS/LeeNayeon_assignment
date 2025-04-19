//
//  LoginViewController.swift
//  Sopt36Assignment
//
//  Created by 이나연 on 4/18/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UIComponents
    
    private lazy var backButton = UIButton().then{
        $0.setImage(.btnBefore, for: .normal)
    }
    
    private lazy var titleLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .pretendard(.medium, size: 23)
        $0.text = "TVING ID 로그인"
    }
    
    private let idTextField = UITextField().then{
        $0.placeholder = "아이디"
        $0.font = .pretendard(.semiBold, size: 15)
        $0.textColor = .gray2
        $0.setPlaceholderColor(.gray2)
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 3
        $0.addLeftPadding(20)
    }

    private lazy var pwInnerView = UIView().then{
        $0.isHidden = true
    }
    
    private let passwordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.font = .pretendard(.semiBold, size: 15)
        $0.textColor = .gray2
        $0.setPlaceholderColor(.gray2)
        $0.backgroundColor = .gray4
        $0.layer.cornerRadius = 3
        $0.addLeftPadding(20)
        $0.isSecureTextEntry = true
    }
    
    private lazy var idClearButton = UIButton().then{
        $0.setImage(.xCircle, for: .normal)
        $0.isHidden = true
    }
    
    private lazy var pwClearButton = UIButton().then{
        $0.setImage(.xCircle, for: .normal)
    }
    
    private lazy var secureButton = UIButton().then{
        $0.setImage(.eyeSlash, for: .normal)
    }
    
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.gray2, for: .normal)
        $0.setTitleColor(.white, for: .selected)
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
        $0.setBackgroundColor(color: .red)
        
    }
    
    private var findStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var findIDButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 0
    }
    
    private lazy var dividerLabel = UILabel().then{
        $0.font = .pretendard(.semiBold, size: 14)
        $0.textColor = .gray2
        $0.text = "|"
    }
    
    private lazy var findPWButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 0
    }
    
    private lazy var helpStackView = UIStackView(arrangedSubviews: [noAccountButton, goMakingNickname]).then{
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        
    }
    
    private lazy var noAccountButton = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.gray3, for: .normal)
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 0
    }
    
    private lazy var goMakingNickname = UIButton().then{
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .pretendard(.semiBold, size: 14)
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 0
        $0.setUnderline()
    }
    
}

extension LoginViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        addViews()
        setLayout()
    }
    
    // MARK: - Layout
    
    private func addViews(){
        [pwClearButton, secureButton].forEach {
            pwInnerView.addSubview($0)
        }
        
        [findIDButton, dividerLabel, findPWButton].forEach{
            findStackView.addSubview($0)
        }
        
        [noAccountButton, goMakingNickname].forEach{
            helpStackView.addSubview($0)
        }
        
        self.view.addSubviews(
            backButton,
            titleLabel,
            idTextField,
            passwordTextField,
            idClearButton,
            pwInnerView,
            loginButton,
            findStackView,
            helpStackView
        )
    }
    
    private func setLayout(){
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(90)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        idClearButton.snp.makeConstraints{
            $0.trailing.equalTo(idTextField.snp.trailing).inset(20)
            $0.centerY.equalTo(idTextField)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        pwInnerView.snp.makeConstraints {
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(20)
            $0.centerY.equalTo(passwordTextField)
        }
        
        pwClearButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        secureButton.snp.makeConstraints{
            $0.leading.equalTo(pwClearButton.snp.trailing).offset(16)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        findIDButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(dividerLabel.snp.leading).offset(-33)
        }
        
        dividerLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(findPWButton.snp.leading).offset(-36)
        }
        
        findPWButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        helpStackView.snp.makeConstraints{
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
        
        noAccountButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        goMakingNickname.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noAccountButton.snp.trailing).offset(33)
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField == idTextField {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray2.cgColor
            idClearButton.isHidden = false
            
        } else if textField == passwordTextField {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray2.cgColor
            pwInnerView.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        if textField == idTextField {
            textField.layer.borderWidth = 0
            idClearButton.isHidden = true
        } else if textField == passwordTextField {
            textField.layer.borderWidth = 0
            pwInnerView.isHidden = true
        }
    }
    
    //MARK: - login
    @objc
    func login(){
        loginButton.isSelected.toggle()
        loginButton.layer.borderWidth = 0
    }

}


#Preview {
    LoginViewController()
}
