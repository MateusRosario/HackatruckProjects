//
//  ContentView.swift
//  Aula2
//
//  Created by Student13 on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "Fulano"
    @State var text: String = ""
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            Image("back").resizable()
                .scaledToFill()
                .blur(radius: 3, opaque: true)
                .overlay(Color.white.opacity(0.7))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Bem Vindo, " + name)
                    .font(.largeTitle)
                
                HStack{
                    TextField("Nome", text: $text).frame(width: 150)
                    
                    Button {
                        text = ""
                    } label: {
                        Text("clear")
                    }
                    
                    Button {
                        name = text
                    } label: {
                        Text("add")
                    }.buttonStyle(.bordered)
                }.padding()
                
                Spacer()
                
                Image("logo")
                    .shadow(color: .gray, radius: 10)
                
                Image("truck")
                    .scaledToFill()
                
                Spacer()
                
                Button {
                    showAlert = true
                } label: {
                    Text("Entrar")
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Entrando"),
                        message: Text("Entrando no desafio Aula 2")
                    )
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
