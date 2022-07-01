//
//  SwiftUIView.swift
//  MathGame
//
//  Created by Aakash Kharabe on 21/06/22.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
       if isActive {
            ContentView()
       } else {
           VStack {
               VStack {
                   Image("images")
                       .font(.system(size: 80))
               }
               .scaleEffect(size)
               .opacity(opacity)
               .onAppear {
                   withAnimation(.easeIn(duration: 1.2)) {
                       self.size = 0.9
                       self.opacity = 1.0
                   }
               }
           }
           .onAppear {
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.isActive = true
               }
           }
       }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
