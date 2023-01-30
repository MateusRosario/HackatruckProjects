//
//  API.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var first_name: String
    var age: Int
    var ip_address: String
    
}

class APIUsers: ObservableObject {
    @Published var users: [User] = []
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://mocki.io/v1/ca7a437a-855e-47a8-883a-98e9f64bdfa7") else { fatalError("Missing URL") }

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
                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        self.users = decodedUsers
                        print(self.users)
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
