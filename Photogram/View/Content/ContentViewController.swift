//
//  ContentViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/29.
//

import UIKit

final class ContentViewController: BaseViewController {
    lazy var textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .secondarySystemBackground
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    var completionHandler: ((String) -> Void)?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let text = textView.text, !text.isEmpty else { return }
        completionHandler?(text)
    }
    
    override func configurationView() {
        view.addSubview(textView)
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
    }
}

