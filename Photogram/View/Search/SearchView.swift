//
//  SearchView.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit

final class SearchView: BaseView {
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "검색어를 입력해주세요"
        return sb
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        cv.register(SearchCollectionCell.self, forCellWithReuseIdentifier: SearchCollectionCell.identifier)
        cv.backgroundColor = .secondarySystemBackground
        return cv
    }()

    override func configureView() {
        self.addSubview(searchBar)
        self.addSubview(collectionView)
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        // view의 self.fram.width는 0이다
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size / 4, height: size / 4)
        return layout
    }
}

