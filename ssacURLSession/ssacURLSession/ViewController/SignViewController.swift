//
//  SignViewController.swift
//  ssacURLSession
//
//  Created by 강호성 on 2021/12/22.
//

import UIKit

class SignViewController: BaseViewController {
    
    // MARK: - Properties
    
    var mainView = SignView()
    
    // MARK: - Lifecycle
    
    // ViewController의 rootView를 로드할 때 호출되는 메서드
    // 새로운 View를 반환하려고할 때 사용
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureUI() {
        mainView.emailTextField.placeholder = "이메일을 작성해주세요"
        mainView.signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
    }
    
//    override func setupConstraints() {
//        
//    }
    
    // MARK: - Action
    
    @objc func signButtonClicked() {
        print("signButtonClicked")
    }
}
