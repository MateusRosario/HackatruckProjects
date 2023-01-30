//
//  HackaFMApp.swift
//  HackaFM
//
//  Created by Student13 on 26/01/23.
//

import SwiftUI

@main
struct HackaFMApp: App {
    var musicsAPI = MusicsAPI()
    var body: some Scene {
        WindowGroup {
            ContentView(musicsAPI: musicsAPI)
        }
    }
}
