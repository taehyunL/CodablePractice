//
//  APIService.swift
//  AuthenticationPractice
//
//  Created by 이태현 on 2022/03/23.
//

import Foundation

class APIService: ObservableObject {
    @Published var model: [Model] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {
            return
        }

        downloadData(fromURL: url) { returnData in
            if let data = returnData {
                let decoder = JSONDecoder()
                
                guard let newModel = try? decoder.decode(Model.self, from: data) else {
                    print("디코딩 오류")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.model.append(newModel)
                }
            } else {
                print("data 없음")
            }
            print(url)
        }
        
    }
    
    func downloadData(fromURL url: URL, complectionHandler: @escaping (_ data: Data?) -> Void ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("data error")
                complectionHandler(nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                print("response error")
                complectionHandler(nil)
                return
            }
            guard error == nil else {
                print("error")
                complectionHandler(nil)
                return
            }
            print(response.value(forHTTPHeaderField: "Date"))
            complectionHandler(data)
        }
        .resume()
    }
}
