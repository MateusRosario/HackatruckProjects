//
//  ContentView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                RedView()
                    .tabItem {
                        Label("Red", systemImage: "suit.heart")
                    }
                
                BlueView()
                    .tabItem {
                        Label("Blue",
                              systemImage: "suit.spade")
                    }
                
                
                GreenView()
                    .tabItem{
                        Label("Green", systemImage: "suit.club")
                    }
                
                
                YellowView()
                    .tabItem{
                        Label("Yellow", systemImage: "suit.diamond")
                    }
            }.onAppear() {
                UITabBar.appearance().backgroundColor = UIColor(Color("back_bar"))
            }
            .accentColor(Color("bar_icon"))
        } //: Tab View
    } //: Navigation View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
