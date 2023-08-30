//
//  SearchViewController.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit
import Kingfisher

final class SearchViewController: BaseViewController {
  
    let mainView = SearchView()
    
    var imageUrlList: [Urls] = []
    
    var delegate: PassImageDelegate?
    
    let usAPIService = UnsplashAPIService.shared
    
    private var networkWorkItem: DispatchWorkItem?
    var searchTerm: String = "" {
        didSet {
            // 이전에 예약된 네트워크 요청을 취소합니다.
            networkWorkItem?.cancel()
            
            // 지연 후 새로운 네트워크 요청을 예약합니다.
            let workItem = DispatchWorkItem {
                Task { [weak self] in
                    guard let self else { return }
                    await request(term: searchTerm)
                }
            }
            networkWorkItem = workItem
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + 0.3,
                execute: workItem
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(recommendKeywordNotificationObserver), name: .recommendKeyword, object: nil)
        mainView.searchBar.becomeFirstResponder()
    }
    
    func request(term: String) async {
        let result = await usAPIService.callRequest(searchTerm: term)
        switch result {
            
        case .success(let value):
            let results = value.results
            self.imageUrlList = results.map { $0.urls }
            self.mainView.collectionView.reloadData()
        case .failure(let error):
            print(error)
        }
        
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
        return imageUrlList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionCell.identifier, for: indexPath) as? SearchCollectionCell else { return UICollectionViewCell() }
        if let url = URL(string: imageUrlList[indexPath.row].small) {
            cell.imageView.kf.setImage(with: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(imageList[indexPath.row])
        // 신호만 보내줌
//        NotificationCenter.default.post(<#T##notification: Notification##Notification#>)
        
        if let nav = navigationController {
            NotificationCenter.default.post(name: .selectImage, object: nil, userInfo: ["url": imageUrlList[indexPath.row].regular])
            nav.popViewController(animated: true)
        } else {
            delegate?.receiveImageFromUrl(imageUrlList[indexPath.row].regular)
            dismiss(animated: true)
        }
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        imageUrlList.removeAll()
//        mainView.collectionView.reloadData()
        searchTerm = "sky"
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            imageUrlList.removeAll()
            mainView.collectionView.reloadData()
        } else {
            searchTerm = searchText
            print(searchText)
        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        Task { await request(term: "sky") }
    }
}
