//
//  Button.swift
//  D20
//
//  Created by Yash Bohra on 29/03/23.
//

import SwiftUI

struct SelectButton: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    @State var img1: String
    @State var img2: String

    var body: some View {
        ZStack{
            Capsule()
                .frame(height: 50)
                .foregroundColor(isSelected ? color : .gray)
            Text(text)
                .foregroundColor(.white)
            Image((isSelected ? img1 : img2))
                .resizable()
                .frame(width: 100,
                height: 100)
                }
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isSelected: .constant(false), color: .blue, text: "Options", img1: "d20 blue", img2: "d20 black")
    }
}
