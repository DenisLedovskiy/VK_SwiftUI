//
//  CustomCell.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 27.04.2022.
//

import SwiftUI

struct CellContentView: View {

    var friends: ViewDataCell

    var body: some View {
        CellView(friends: friends)
    }
}

struct CellView: View {

    var friends: ViewDataCell

    var body: some View {

        HStack {
            CellImage {
                Image (friends.imageName)
            }

            VStack(alignment: .leading){
                Text(friends.name)
                    .font(.custom("Arial", fixedSize: 20))
                Text(friends.status)
                    .foregroundColor(.gray)
                    .font(.custom("Arial", fixedSize: 15))
            }
        }
    }
}

struct CustomCellView_Previews: PreviewProvider {

    static var previews: some View {
        CellContentView(friends: FriendList.friends.first!)
    }
}

extension View {

    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

