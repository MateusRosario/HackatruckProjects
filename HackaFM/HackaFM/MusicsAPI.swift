//
//  MusicsAPI.swift
//  HackaFM
//
//  Created by Student13 on 26/01/23.
//

import Foundation

struct Music: Codable {
    var _id: String
    var name: String
    var capa: String
    var artista: String
}


class MusicsAPI: ObservableObject {
    @Published var musics: [Music] = []
    
    func getMusics(completion: @escaping ([Music]) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/mateus-musics") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([Music].self, from: data)
                        self.musics = decodedUsers
//                        print(decodedUsers)
                        completion(decodedUsers)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}

