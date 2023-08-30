//
//  SearchViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit

final class SearchViewController: BaseViewController {
  
    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "star.fill", "xmark", "person.circle"]
    
    var delegate: PassImageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(recommendKeywordNotificationObserver), name: .recommendKeyword, object: nil)
        mainView.searchBar.becomeFirstResponder()
    }
    
    @objc func recommendKeywordNotificationObserver(_ notification: NSNotification) {
        print(#function)
    }
    override func configurationView() {
        super.configurationView()
        view.addSubview(mainView)
        mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    override func setConstraints() {
        super.setConstraints()
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionCell.identifier, for: indexPath) as? SearchCollectionCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(systemName: imageList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(imageList[indexPath.row])
        // 신호만 보내줌
//        NotificationCenter.default.post(<#T##notification: Notification##Notification#>)
//        NotificationCenter.default.post(name: .selectImage, object: nil, userInfo: ["name": imageList[indexPath.row], "sample": "고래밥"])
        
        delegate?.receiveImage(imageName: imageList[indexPath.row])
        dismiss(animated: true)
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
    }
    
}
