//
//  DateView.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/29.
//

import UIKit

final class DateView: BaseView {
    private lazy var picker: UIDatePicker = {
        let pk = UIDatePicker()
        pk.datePickerMode = .date
        pk.preferredDatePickerStyle = .wheels
        return pk
    }()
    
    override func configureView() {
        self.addSubView(picker)
    }
    override func setConstraints() {
        picker.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    func getDate() -> Date {
        return picker.date
    }
}
