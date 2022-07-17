//
//  NetworkManager.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/11/22.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getData/*<T: Codable>*/(urlString: String, /*decoding:  T.Type,*/ completion: @escaping(Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) {data, response, error in
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
}
