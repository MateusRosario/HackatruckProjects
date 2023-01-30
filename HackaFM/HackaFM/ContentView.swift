//
//  ContentView.swift
//  HackaFM
//
//  Created by Student13 on 26/01/23.
//

let capaPlaceholderURL = "data:image/jpeg;base64,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"

import SwiftUI

struct ContentView: View {
    @State var musicsAPI: MusicsAPI
    @State var musics: [Music] = []
    
    func addPlaceholders(musicsList: [Music]) -> [Music] {
        var musics = musicsList
        if musics.count > 0 {
            for i in 0 ... 10 {
                musics += [Music(_id: String(i), name: "Music Placeholder", capa: capaPlaceholderURL, artista: "Placehodler")]
            }
        }
        
        return musics
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("back_top"), Color("back_bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                ScrollView {
                    Image("HackaTruck")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("HackaFM")
                        .font(.title)
                    VStack (alignment: .leading) {
                        ForEach(addPlaceholders(musicsList: musics), id: \._id) { music in
                            NavigationLink {
                                MusicView(music: music)
                            } label: {
                                HStack {
                                    AsyncImage(url: URL(string: music.capa)) { image in
                                        image
                                            .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: 50, alignment: .center)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    VStack (alignment: .leading) {
                                        Text(music.name).font(.headline)
                                        Text(music.artista).font(.subheadline)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }.padding()
                    VStack (alignment: .leading) {
                        Text("Sugeridos").font(.largeTitle).frame(alignment: .leading)
                    }
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(addPlaceholders(musicsList: musics), id: \._id) { music in
                                AsyncImage(url: URL(string: music.capa)) { image in
                                    image
                                        .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 200, height: 200, alignment: .center)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    musicsAPI.getMusics { data in
                        self.musics = data
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(musicsAPI: MusicsAPI())
    }
}
