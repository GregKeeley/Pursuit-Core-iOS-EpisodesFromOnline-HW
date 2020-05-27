//
//  EpisodeAPI.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Gregory Keeley on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodeAPI {
    static func getEpisodes(for searchQuery: String, completion: @escaping (Result<[Episode], AppError>) -> ()) {
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "538"
        let showSearchEndpointURL = "http://api.tvmaze.com/shows/\(searchQuery)/episodes"
        guard let url = URL(string: showSearchEndpointURL) else {
            completion(.failure(.badURL(showSearchEndpointURL)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode(Episode.self, from: data)
                    var episodes = [Episode]()
                    episodes.append(searchResults)
                    completion(.success(episodes))
                } catch {
                    
                }
            }
        }
    }
}
