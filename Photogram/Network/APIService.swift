//
//  APIService.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/30.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}
    
    func callRequest() {
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        let request = URLRequest(url: url!)
        print("request")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let value = String(data: data!, encoding: .utf8)
            print(data)
            print(response)
            print(error)
        }.resume()
        
    }
}
