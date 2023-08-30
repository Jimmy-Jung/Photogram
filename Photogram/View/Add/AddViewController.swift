//
//  ViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit
import SeSACFramework

protocol PassDataDelegate {
    func receiveDate(date: Date)
}

protocol PassImageDelegate {
    func receiveImage(imageName: String)
}

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    // superClass 호출하면 안됨
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.searchButtonTapped = searchButtonTapped
        mainView.dateButtonTapped = dateButtonTapped
        mainView.searchProtocolButtonTapped = searchProtocolButtonTapped
        mainView.titleButtonTapped = titleButtonTapped
        mainView.secondTitleButtonTapped = secondTitleButtonTapped
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        NotificationCenter.default.removeObserver(self, name: .selectImage, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver(_:)), name: .selectImage, object: nil)
      
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: .selectImage, object: nil)
    }
    
    @objc func selectImageNotificationObserver(_ notification: NSNotification) {
        print(#function)
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.changeImage(UIImage(systemName: name))
        }
    }
    private func searchButtonTapped() {
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        NotificationCenter.default.post(name: .recommendKeyword, object: nil, userInfo: ["word" : word.randomElement()!])
        transition(viewController: SearchViewController(), style: .pushNavigation)
        // 이렇게 하면 100% 작동될 거라는걸 보장할 수 없음
//        NotificationCenter.default.post(name: NSNotification.Name("RecommendKeyword"), object: nil, userInfo: ["word" : word.randomElement()!])
        
    }
    
    private func dateButtonTapped() {
        let vc = DateViewController()
        vc.delegate = self
        transition(viewController: vc, style: .pushNavigation)
    }
    
    private func searchProtocolButtonTapped() {
        let vc = SearchViewController()
        vc.delegate = self
        transition(viewController: vc, style: .present)
    }
    
    private func titleButtonTapped() {
        let vc = TitleViewController()
        vc.completionHandler = { [weak self] (text, _, _) in
            self?.mainView.titleButton.setTitle(text, for: .normal)
        }
        vc.title = "TitlePage"
        transition(viewController: vc, style: .pushNavigation)
    }
    
    private func secondTitleButtonTapped() {
        let vc = ContentViewController()
        vc.completionHandler = { [weak self] (text: String) in
            self?.mainView.secondTitleButton.setTitle(text, for: .normal)
        }
        transition(viewController: vc, style: .pushNavigation)
    }
    override func configurationView() {
        super.configurationView()
        print("Add Configuration")
    }
    
    override func setConstraints() {
        super.setConstraints()
        print("add setConstraints")
        
    }

}

extension AddViewController: PassDataDelegate {
    func receiveDate(date: Date) {
        print(#function)
        mainView.dateButton.configuration?.title = "\(DateFormatter.convertDate(date: date))"
    }
}

extension AddViewController: PassImageDelegate {
    func receiveImage(imageName: String) {
        
        mainView.changeImage(UIImage(systemName: imageName))
    }
    
    
}
