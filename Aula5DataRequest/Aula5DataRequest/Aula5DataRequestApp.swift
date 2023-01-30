//
//  Aula5DataRequestApp.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import SwiftUI

@main
struct Aula5DataRequestApp: App {
    var api = APIUsers()
    
    var body: some Scene {
        WindowGroup {
            ContentView(api: api)
        }
    }
}
