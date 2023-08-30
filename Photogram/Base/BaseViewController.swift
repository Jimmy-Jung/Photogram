//
//  BaseViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurationView()
        setConstraints()
    }

    func configurationView() {
        
        print("Base configuration")
    }
    
    func setConstraints() {
     print("Base setConstraints")
    }
}
