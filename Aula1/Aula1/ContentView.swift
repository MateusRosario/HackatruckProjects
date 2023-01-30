//
//  ContentView.swift
//  Aula1
//
//  Created by Student13 on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    @State private var list: [String] = []
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("truck")
                .resizable()
                .scaledToFit()
                .offset(x: 90)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white))
                .shadow(radius: 7)
                .foregroundColor(.accentColor)
            
            Text("HackaTruck")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
            //            Spacer()
            
            HStack(){
                Text("Maker")
                    .font(.title)
                    .foregroundColor(.blue)
                Text("Space")
                    .font(.title)
                    .foregroundColor(.green)
            } //: HStack
            
            Spacer()
            
            HStack{
                TextField("Texto Aqui", text: $text)
                
                Button {
                    list.append(text)
                } label: {
                    Text("Adicionar")
                }
            } //: HStack
            .padding()
            
            Spacer()
            
//            Text(list.last ? list.last : nil)
            
            Spacer()
        } //: VStack
        .padding()
        .buttonStyle(.bordered)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
