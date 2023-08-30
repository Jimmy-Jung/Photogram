//
//  UnsplashAPIService.swift
//  Photogram
//
//  Created by 정준영 on 2023/08/31.
//

import Foundation

final class UnsplashAPIService {
    static let shared = UnsplashAPIService()
    private init() {}
    
    typealias NetworkResult = Result<Unsplash, NetworkError>
    
    func callRequest(
        searchTerm: String,
        page: Int = 1,
        pagePer: Int = 10
    ) async -> NetworkResult {
        let baseURL = "https://api.unsplash.com/search/photos?"
        let searchQuery = "query=\(searchTerm)&"
        let clientID = "client_id=\(APIKEY.Unsplash_Access_Key)&"
        let page = "page=\(page)&"
        let pagePer = "per_page=\(pagePer)"
        let urlString = baseURL + searchQuery + clientID + page + pagePer
        guard let encodedUrlString = urlString
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { return .failure(.urlError) }
        return await performRequest(with: encodedUrlString)
    }
    
    private func performRequest(with urlString: String) async -> NetworkResult {
        do {
            guard let url = URL(string: urlString) else {return .failure(.urlError)}
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failure(.serverResponseError)
            }
            return parseJSON(data)
        } catch {
            return .failure(.dataError)
        }
    }
    
    private func parseJSON(_ unsplashData: Data) -> NetworkResult {
        do {
            let unsplash = try JSONDecoder().decode(Unsplash.self, from: unsplashData)
            return .success(unsplash)
        } catch {
            return .failure(.parseError)
        }
    }
}
