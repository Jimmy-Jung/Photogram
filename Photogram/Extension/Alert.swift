//
//  Alert.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit

extension UIViewController {
    func showCancelAlert(
            title: String?,
            message: String?,
            preferredStyle: UIAlertController.Style,
            cancelTitle: String? = "확인"
        ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
            
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
            
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
    
    func showCancelAlert(
            title: String?,
            message: String?,
            preferredStyle: UIAlertController.Style,
            cancelTitle: String?,
            okTitle: String?,
            cancelHandler: ((UIAlertAction) -> Void)?,
            okHandler: ((UIAlertAction) -> Void)?
        ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
            
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
            let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
}
