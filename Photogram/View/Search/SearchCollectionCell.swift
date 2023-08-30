//
//  SearchCollectionCell.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit

class SearchCollectionCell: BaseCollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override func configurationView() {
        contentView.addSubview(imageView)
    }
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
