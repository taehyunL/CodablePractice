//
//  File.swift
//  Authemtication
//
//  Created by 이태현 on 2022/03/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    @Published var isAuthentication = false
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(email: email, password: password) { result in
            switch result {
                case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                print(token)
                
                DispatchQueue.main.async {
                    self.isAuthentication = true
                }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
