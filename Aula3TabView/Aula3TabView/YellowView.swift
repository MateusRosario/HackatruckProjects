//
//  YellowView.swift
//  Aula3TabView
//
//  Created by Student13 on 20/01/23.
//

import SwiftUI

struct YellowView: View {
    var body: some View {
        ZStack {
            Color("yellow_view").edgesIgnoringSafeArea(.all)
            Text("Yellow View!")
        }
    }
}

struct YellowView_Previews: PreviewProvider {
    static var previews: some View {
        YellowView()
    }
}
