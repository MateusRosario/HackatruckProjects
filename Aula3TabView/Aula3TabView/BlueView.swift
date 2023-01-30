//
//  BlueView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct BlueView: View {
    var body: some View {
        ZStack {
            Color("blue_view").edgesIgnoringSafeArea(.all)
            Text("Blue View!")
        }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}
