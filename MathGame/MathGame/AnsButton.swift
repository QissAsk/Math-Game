//
//  AnsButton.swift
//  MathGame
//
//  Created by Aakash Kharabe on 21/06/22.
//

import SwiftUI

struct AnsButton: View {
    var number : Int
    var body: some View {
        Text("\(number)")
        .frame(width: 110, height: 110)
        .font(.system(size: 40, weight: .bold))
        .foregroundColor(Color.white)
        .background(Color.blue)
        .clipShape(Circle())
        .padding()
    }
}

struct AnsButton_Previews: PreviewProvider {
    static var previews: some View {
        AnsButton(number: 100)
    }
}
