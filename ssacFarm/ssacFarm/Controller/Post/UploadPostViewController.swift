//
//  UploadPostViewController.swift
//  ssacFarm
//
//  Created by 강호성 on 2021/12/31.
//

import UIKit

class UploadPostViewController: UIViewController {
    
    // MARK: - Properties
    
    var navigationTitle = ""
    var content = ""
    var isUpdated = ""
    
    var postId = 0
    var commentId = 0
        
    private let captionTextView = InputTextView()
    var viewModel = ButtonViewModel()
    
    let tk = TokenUtils()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("완료", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleUploadPost), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureUI()
        configureContentData()
        print(commentId, postId, isUpdated)
    }
    
    // MARK: - Actions
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUploadPost() {
        let token = tk.load("\(Endpoint.auth_register.url)", account: "token") ?? "no token"
        let text = viewModel.content ?? ""
        
        if isUpdated == "post" {
            APIService.postEdit(id: postId, token: token, text: text) { post, error in
                if let _ = post {
                    print("게시물 수정, \(text)")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        } else if isUpdated == "comment" {
            print(commentId, postId)
            APIService.commentEdit(token: token, id: commentId, postId: postId, comment: text) { comment, error in
                if let error = error {
                    print(error)
                    return
                }
                
                if let _ = comment {
                    print("댓글 수정, \(text)")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        } else {
            APIService.postWrite(token: token, text: text) { post, _ in
                if let _ = post {
                    print("게시물 작성, \(text)")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }

    // MARK: - Helper
    
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButton)
    }
    
    func configureUI() {
        self.title = navigationTitle
        view.backgroundColor = .white
        
        view.addSubview(captionTextView)
        captionTextView.delegate = self
        captionTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
    }
    
    func configureContentData() {
        if content != "" {
            captionTextView.placeholderText = nil
            captionTextView.text = content
        }
    }
}

// MARK: - FormViewModel

extension UploadPostViewController: FormViewModel {
    func updateForm() {
        doneButton.isEnabled = viewModel.formIsValid
        doneButton.backgroundColor = viewModel.buttonBackgroundColor
    }
}

// MARK: - UITextViewDelegate

extension UploadPostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView == captionTextView {
            viewModel.content = textView.text
        }
        updateForm()
    }
}
