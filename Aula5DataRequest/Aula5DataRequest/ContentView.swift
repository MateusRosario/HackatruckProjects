//
//  ContentView.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    var api : APIUsers = APIUsers()
    var dataApi: DataAPI = DataAPI()
    @State var users: [User] = []
    
    
    var body: some View {
        TabView {
            UsersView(api: api)
                .tabItem {
                    Label("Users", systemImage: "person")
                }
            
            DataView(api: dataApi)
                .tabItem {
                    Label("Data", systemImage: "house")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(api: APIUsers())
    }
}


// https://cs193p.sites.stanford.edu
