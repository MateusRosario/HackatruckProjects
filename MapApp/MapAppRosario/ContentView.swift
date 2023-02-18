//
//  ContentView.swift
//  MapAppRosario
//
//  Created by Student13 on 27/01/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var api: MapAPI
    @State private var locals: [Local] = []
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -10.183658, longitude: -48.333512), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    func handleNewLocal(local: Local) {
        locals.append(local)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Map(coordinateRegion: $mapRegion).ignoresSafeArea(.all)
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                MapView(local: nil, noLocal: true, api: api, handleNewLocal: handleNewLocal)
                            } label: {
                                Image(systemName: "viewfinder")
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding().font(.title)
                }
                Spacer()
                ScrollView {
                    ForEach(Array(locals.enumerated() ), id: \.offset) { (index, local) in
                        if index == locals.count {
                            HStack {
                                Text("Add")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            
                        }else{
                            NavigationLink {
                                MapView(local: local, noLocal: false, api: api, handleNewLocal: handleNewLocal)
                            } label: {
                                HStack {
                                    Text(local.name)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }.padding()
            }
            .padding()
            .onAppear {
                api.getLocals { data in
                    locals = data
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(api: MapAPI())
    }
}
