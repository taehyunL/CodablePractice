//
//  ContentView.swift
//  PostingJSON
//
//  Created by 이태현 on 2022/03/24.
//


import SwiftUI

struct ContentView: View {
    @StateObject var api = APIService()
    
    @State var test = ""
    
    var body: some View {
        ZStack {

            VStack {
                Section {
                    TextField("name", text: $api.user.email)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    HStack {
                        Text("username")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                Section {
                    TextField("password", text: $api.user.password)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    HStack {
                        Text("password")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                Button {
                    //action
                    Task {
                        await encodingUser()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.red)
                            .frame(height: 40)
                            .padding(.vertical)
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                }
            }
            .padding()
        }
    }
    func encodingUser() async {
        guard let encoded = try? JSONEncoder().encode(api.user) else {
            return
        }
        
        let url = URL(string: "https://reqres.in/api/users")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(userModel.self, from: data)
            print(decodedOrder.email)
            print(decodedOrder.password)
        } catch {
            print("오류")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
