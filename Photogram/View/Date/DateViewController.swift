//
//  DateViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/29.
//

import UIKit

final class DateViewController: BaseViewController {
    let mainView = DateView()
    var delegate: PassDataDelegate?
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.receiveDate(date: mainView.getDate())
    }

        
    
    override func configurationView() {
        super.configurationView()
        
    }
    
    override func setConstraints() {
     super.setConstraints()
    }
}
