//
//  NetworkManager.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 22.03.2023.
//

import Foundation


enum YuGiError : String,Error{
    case invalidURL = "Bad URL"
    case unableToComplete = "Check your internet connection"
    case invalidResponse = "Invalid Response"
    case invalidData = "The data received from the server was invalid. Please try again!"
    case alreadyInFavorites = "User already in Favorites List"
    
}


class NetworkManager {
    static let shared = NetworkManager()
    init() { }
    
    func getData(completion:@escaping(_ result:Result<DataModel?,YuGiError>)->()) {
        guard let url = URL(string: APIServices.baseURL()) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try? decoder.decode(DataModel.self, from: data)
                completion(.success(result))
            }
            
        }
        task.resume()
    }
    
    func getImage(imageURL:String, completion:@escaping(_ result:Result<Data,YuGiError>)->()) {
        guard let url = URL(string: imageURL) else { return }
        let imageTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(data))
        }
        imageTask.resume()
    }
    
    
}
