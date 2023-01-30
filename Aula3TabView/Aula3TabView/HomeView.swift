//
//  HomeView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
//        Text("Home View!")
        
        NavigationLink {
            RedView()
        } label: {
            Text("Entre aqui")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
