//
//  AddView.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit
import JimmyKit

final class AddView: BaseView {
    private lazy var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .secondarySystemFill
        return iv
    }()

    private lazy var searchButton: UIButton = ButtonBuilder(.plain)
        .image(SystemImage.makeImage(.search))
        .addAction { [unowned self] in self.searchButtonTapped?() }
        .makeButton()
    
    lazy var searchProtocolButton: UIButton = ButtonBuilder(.filled)
        .image(SystemImage.makeImage(.squareUp))
        .addAction { [unowned self] in self.searchProtocolButtonTapped?()}
        .makeButton()
    
    lazy var dateButton: UIButton = ButtonBuilder(.filled)
        .title("\(DateFormatter.today())")
        .baseBackgroundColor(.systemGreen)
        .baseForegroundColor(.white)
        .cornerRadius(0)
        .addAction { [unowned self] in self.dateButtonTapped?() }
        .makeButton()
    
    lazy var titleButton: UIButton = ButtonBuilder(.filled)
        .title("오늘의 사진")
        .cornerRadius(0)
        .addAction { [unowned self] in self.titleButtonTapped?()}
        .makeButton()
    
    lazy var secondTitleButton: UIButton = ButtonBuilder(.filled)
        .title("secondTitleButton")
        .baseBackgroundColor(.systemOrange)
        .cornerRadius(0)
        .addAction { [unowned self] in self.secondTitleButtonTapped?()}
        .makeButton()
    
    
    var searchButtonTapped: (() -> ())?
    var dateButtonTapped: (() -> ())?
    var searchProtocolButtonTapped: (() -> ())?
    var titleButtonTapped: (() -> ())?
    var secondTitleButtonTapped: (() -> ())?
    
    func changeImage(_ image: UIImage?) {
        photoImageView.image = image
    }
    
    func changeImageFromURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            photoImageView.kf.setImage(with: url)
        }
    }

    // 무조건 superClass에 있는 configuration메서드를 실행 할 필요는 없음
    override func configureView() {
        [photoImageView, searchButton, dateButton, searchProtocolButton, secondTitleButton, titleButton].forEach {self.addSubview($0)}
    }
    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
        
        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.leading.equalTo(photoImageView)
        }
        
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
        
        secondTitleButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
