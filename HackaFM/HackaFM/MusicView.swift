//
//  MusicView.swift
//  HackaFM
//
//  Created by Student13 on 26/01/23.
//

import SwiftUI

import AVKit

struct MusicView: View {
    var music: Music
    @State var audioPlayer: AVAudioPlayer!
    @State var iconePlayer: String = "pause.fill"
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("back_top"), Color("back_bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            VStack {
                Spacer()
                
                AsyncImage(url: URL(string: music.capa)) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }.padding()
                
                Text(music.name).font(.largeTitle).bold()
                Text(music.artista).font(.title)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: "repeat")
                    Spacer()
                    Image(systemName: "backward.end.fill")
                    Image(systemName: iconePlayer).onTapGesture {
                        
                        if audioPlayer.isPlaying {
                            audioPlayer.pause()
                            iconePlayer = "play.fill"
                        } else {
                            audioPlayer.play()
                            iconePlayer = "pause.fill"
                        }
                    }
                    Image(systemName: "forward.end.fill")
                    Spacer()
                    Image(systemName: "repeat.1")
                    Spacer()
                }.font(.title)
                
                Spacer()
            }.onAppear {
                guard let sound = NSDataAsset(name: "musicPlaceholder")?.data else {
                    fatalError("Unable to find asset")
                }
                self.audioPlayer = try! AVAudioPlayer(data: sound)
                
                if self.audioPlayer != nil {
                    audioPlayer.play()
                }
            }
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(music: Music(_id: "", name: "Placeholder", capa: capaPlaceholderURL, artista: "Placeholder"))
    }
}
