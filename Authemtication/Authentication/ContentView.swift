//
//  ContentView.swift
//  Authemtication
//
//  Created by 이태현 on 2022/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: loginVM.isAuthentication ? "lock.fill" : "lock.open")
                }
                TextField("email", text: $loginVM.email)
                    .textFieldStyle(.roundedBorder)
                TextField("password", text: $loginVM.password)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                HStack {
                    Button {
                        loginVM.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                            Text("login")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 30)
                    Button {
//                        //sign out action
//                        loginVM.isAuthentication = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                            Text("sign out")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 30)
                }
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
