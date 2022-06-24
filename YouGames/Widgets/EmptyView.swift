//
//  EmptyView.swift
//  YouGames
//
//  Created by sona setiana on 17/06/22.
//

import SwiftUI

struct EmptyView: View {
    var message : String?
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Text(message ?? "No Data Found")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
