//
//  URLSession+Extension.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/13/22.
//

import Foundation
extension URLSession {
    func getData/*<T: Codable>*/(from urlString: String, /*decoding:  T.Type,*/ completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = self.dataTask(with: request) {data, response, error in
            guard let data = data else { return completion(.failure(.badData)) }
            completion(.success(data))
        }
        task.resume()
    }
    
    private func decodeJSON<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
enum NetworkError: Error {
    case badData
}
