//
//  RedView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct RedView: View {
    @State private var openModal: Bool = false
    var body: some View {
        ZStack {
            Color("red_view").edgesIgnoringSafeArea(.all)
            
            Button {
                openModal = true
            } label : {
                Text("Clique aqui")
            }.sheet(isPresented: $openModal) {
                ModalView(name: "Red View")
            }
        }
    }
}


struct ModalView: View {
    var name: String
    
    var body: some View {
        Text("Essa é a " + name + "!")
    }
}

struct RedView_Previews: PreviewProvider {
    static var previews: some View {
        RedView()
    }
}
