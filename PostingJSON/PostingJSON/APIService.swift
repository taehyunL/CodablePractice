//
//  APIService.swift
//  PostingJSON
//
//  Created by 이태현 on 2022/03/24.
//

import Foundation

class APIService: ObservableObject {
    @Published var user = userModel()
    
    func encode(to encoder: Encoder) throws {
        
    }
}
