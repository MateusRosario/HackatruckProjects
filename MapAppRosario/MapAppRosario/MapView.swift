//
//  MapView.swift
//  MapAppRosario
//
//  Created by Student13 on 27/01/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var local: Local?
    @State var noLocal: Bool
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -10.183658, longitude: -48.333512), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State var longPressLocation = CGPoint.zero
    
    @State var showModal = false
    
    @State private var localNewName: String = ""
    
    @State var api: MapAPI
    
    @State var showingConfirmation = false
    @State private var confirmationMessage = ""
    
    var handleNewLocal: (Local) -> Void
    
    private func printLocation() {
        print("x: \(longPressLocation.x) - y: \(longPressLocation.y)")
    }
    
    func convertTap(at point: CGPoint, for mapSize: CGSize) -> Local {
            let lat = mapRegion.center.latitude
            let lon = mapRegion.center.longitude
            
            let mapCenter = CGPoint(x: mapSize.width/2, y: mapSize.height/2)
            
            // X
            let xValue = (point.x - mapCenter.x) / mapCenter.x
            let xSpan = xValue * mapRegion.span.longitudeDelta/2
            
            // Y
            let yValue = (point.y - mapCenter.y) / mapCenter.y
            let ySpan = yValue * mapRegion.span.latitudeDelta/2
            
        return Local(_id: "", name: "", latitude: lat - ySpan, longitude: lon + xSpan)
    }
    
    var body: some View {
        VStack{
            GeometryReader { proxy in
                Map(coordinateRegion: $mapRegion, interactionModes: .all, showsUserLocation: true, annotationItems: noLocal ? []: [local!]) { local in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: local.latitude, longitude: local.longitude))
                }.gesture(LongPressGesture(
                    minimumDuration: 0.25)
                    .sequenced(before: DragGesture(
                        minimumDistance: 0,
                        coordinateSpace: .local))
                        .onEnded { value in
                            switch value {
                            case .second(true, let drag):
                                longPressLocation = drag?.location ?? .zero
                                printLocation()
                                noLocal = false
                                local = convertTap(at: longPressLocation, for: proxy.size)
                            default:
                                break
                            }
                        })
                .highPriorityGesture(DragGesture(minimumDistance: 10))
            }
            HStack {
                if !noLocal {
                    Spacer()
                    Text(local!.name)
                    Spacer()
                    Button {
                        showModal.toggle()
                    } label: {
                        Image(systemName: "plus.rectangle")
                    }.sheet (isPresented: $showModal) {
                        VStack {
                            TextField("Nome do local", text: $localNewName)
                            Button {
                                local?.name = localNewName
                                Task {
                                    await api.postLocal(local: local!) { message in
                                        confirmationMessage = message
                                        showingConfirmation = true
                                        showModal = false
                                    }
                                }
                            } label: {
                                Text("Salvar")
                            }.alert("Thank you!", isPresented: $showingConfirmation) {
                                Button("OK") { }
                            } message: {
                                Text(confirmationMessage)
                            }
                        }
                    }.buttonStyle(.borderedProminent)
                } else {
                    Spacer()
                    if local?.name != nil {
                        Text(local!.name)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(local: Local(_id: "", name: "teste", latitude: 20.0, longitude: 15.0), noLocal: false, api: MapAPI(), handleNewLocal: {local in })
    }
}
