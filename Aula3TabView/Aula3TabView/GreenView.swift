//
//  GreenView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct GreenView: View {
    var body: some View {
        ZStack {
            Color("green_view").edgesIgnoringSafeArea(.all)
            Text("Green View!")
        }
    }
}

struct GreenView_Previews: PreviewProvider {
    static var previews: some View {
        GreenView()
    }
}
