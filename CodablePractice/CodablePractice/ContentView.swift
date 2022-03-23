//
//  ContentView.swift
//  AuthenticationPractice
//
//  Created by 이태현 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = APIService()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vm.model, id: \.self) { model in
                        NavigationLink {
                            detailView(model: model)
                        } label: {
                            VStack {
                                Text("\(model.page)")
                                Text("\(model.perPage)")
                                Text("\(model.total)")
                                Text("\(model.totalPages)")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
