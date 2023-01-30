//
//  MapAppRosarioApp.swift
//  MapAppRosario
//
//  Created by Student13 on 27/01/23.
//

import SwiftUI

@main
struct MapAppRosarioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(api: MapAPI())
        }
    }
}
