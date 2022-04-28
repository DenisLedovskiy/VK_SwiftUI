//
//  CustomCell.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 27.04.2022.
//

import SwiftUI

struct CellCintentView: View {

    var body: some View {
        CellView()
            .frame(width: 300, height: 100, alignment: .leading)
    }

}

struct CellView: View {

    var body: some View {
        ZStack {

            HStack{
                CellImage {
            Image ("ava")
                }

                VStack{
                    Text("Меган Фокс")
                        .font(.custom("Arial", fixedSize: 20))
                    Text("Онлайн")
                        .foregroundColor(.gray)
                        .font(.custom("Arial", fixedSize: 15))
                }
            }
        }
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CellCintentView()
    }
}

extension View {

    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

