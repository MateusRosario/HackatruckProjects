//
//  DataAPI.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import Foundation

struct Data: Codable {
    var _id: String
    var nome: String
    var sobrenome: String
    var idade: String
}


class DataAPI: ObservableObject {
    @Published var data: [Data] = []
    
    func getUsers(completion: @escaping ([Data]) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/dados") else { fatalError("Missing URL") }
        
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
                        let decodedUsers = try JSONDecoder().decode([Data].self, from: data)
                        self.data = decodedUsers
                        print(decodedUsers)
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
