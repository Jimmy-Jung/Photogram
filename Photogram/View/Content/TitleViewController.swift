//
//  TitleViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/29.
//

import UIKit
import JimmyKit

final class TitleViewController: BaseViewController {
    let textField = UITextField()
        .attributedPlaceholder(
            "제목을 입력해 주세요",
            color: .systemGreen,
            font: .boldSystemFont(ofSize: 17)
        )
    var completionHandler: ((String, Int, Bool) -> Void)?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let text = textField.text, !text.isEmpty else { return }
        completionHandler?(text, 0, false)
    }
    
    override func configurationView() {
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
    }
    
    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
    @objc private func doneButtonTapped() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
}
