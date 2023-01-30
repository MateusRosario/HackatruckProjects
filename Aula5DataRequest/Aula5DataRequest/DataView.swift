//
//  DataView.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import SwiftUI

struct DataView: View {
    @State var api : DataAPI
    @State var data: [Data] = []
    
    
    var body: some View {
        List(data, id: \._id) { each in
            HStack{
                Text(each.nome)
                Text(each.sobrenome)
                Text(each._id)
            }
        }.onAppear {
            api.getUsers { dados in
                data = dados
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(api: DataAPI())
    }
}
