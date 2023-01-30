//
//  LocalsAPI.swift
//  MapAppRosario
//
//  Created by Student13 on 27/01/23.
//

import Foundation

struct Local: Decodable, Identifiable, Encodable {
    let id = UUID()
    var _id: String
    var name: String
    var latitude: Double
    var longitude: Double
}

struct UpLocal: Encodable {
    var name: String
    var latitude: Double
    var longitude: Double
}

class MapAPI: ObservableObject {
    @Published var locals: [Local] = []
    
    func getLocals(completion: @escaping ([Local]) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:1880/mateus-locals") else { fatalError("Missing URL") }
        
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
                        let decodedUsers = try JSONDecoder().decode([Local].self, from: data)
                        self.locals = decodedUsers
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
    
    
    func postLocal(local: Local, confirmation: @escaping (String) -> Void) async {
        let newLocal = UpLocal(name: local.name, latitude: local.latitude, longitude: local.longitude)
        guard let encoded = try? JSONEncoder().encode(newLocal) else {
            print("Failed to encode order")
            return
        }
        
        print("Encoded", encoded)
        
        let url = URL(string: "http://127.0.0.1:1880/mateus-local")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
//            print("1 aqui")
//            let decodedOrder = try JSONDecoder().decode(Local.self, from: data)
            print(response)
            confirmation("Your order for saving \(local.name) is on its way!")
        } catch {
            print("Checkout failed.")
        }
    }
    
}


