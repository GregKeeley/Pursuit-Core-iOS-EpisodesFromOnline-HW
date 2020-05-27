//
//  ImageClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Gregory Keeley on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

struct ImageClient {
    static func getImage(for urlString: String, completion: @escaping (Result<UIImage?,AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
