//
//  NetworkError.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/31.
//

import Foundation

public enum ErrorString {
    static let networkingError = "네트워킹에 문제가 있습니다."
    static let dataError = "데이터를 불러오는데 문제가 발생했습니다."
    static let parseError = "데이터를 분석하는데 문제가 발생했습니다."
    static let urlError = "url주소가 잘못됐습니다."
    static let serverResponseError = "서버에서 데이터를 받아오는데 문제가 발생했습니다."
}

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
    case urlError
    case serverResponseError
    
    var localizedDescription: String {
        switch self {
        case .networkingError:
            return ErrorString.networkingError
        case .dataError:
            return ErrorString.dataError
        case .parseError:
            return ErrorString.parseError
        case .urlError:
            return ErrorString.urlError
        case .serverResponseError:
            return ErrorString.serverResponseError
        }
    }
}
