//
//  SystemImage.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/28.
//

import UIKit.UIImage

enum SystemImage: String {
    case search = "magnifyingglass"
    case squareUp = "square.and.arrow.up"
    
    static func makeImage(_ image: Self) -> UIImage? {
        return UIImage(systemName: image.rawValue)
    }
}
