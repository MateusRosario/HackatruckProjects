//
//  UsersView.swift
//  Aula5DataRequest
//
//  Created by Student13 on 25/01/23.
//

import SwiftUI

struct UsersView: View {
    @State var api : APIUsers
    @State var users: [User] = []
    
    
    var body: some View {
        VStack {
            Text("List de Usuários").font(.largeTitle)
            List(users) { user in
                VStack {
                    HStack {
                        Text(user.first_name)
                        Text(String(user.age))
                    }
                    Text(user.ip_address)
                }
            }
        }
        .onAppear {
            api.getUsers {data in
                self.users = data
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(api: APIUsers())
    }
}
