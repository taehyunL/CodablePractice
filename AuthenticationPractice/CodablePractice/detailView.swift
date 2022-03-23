//
//  detailView.swift
//  AuthenticationPractice
//
//  Created by 이태현 on 2022/03/24.
//

import SwiftUI

struct detailView: View {
    let model: Model
    
    var body: some View {
        List(model.data, id: \.self) { data in
            VStack(alignment: .center) {
                Text("\(data.id)")
                Text(data.email)
                Text(data.firstName)
                Text(data.lastName)
                AsyncImage(url: URL(string: data.avatar)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
//
//struct detailView_Previews: PreviewProvider {
//    static var previews: some View {
//        detailView()
//    }
//}
