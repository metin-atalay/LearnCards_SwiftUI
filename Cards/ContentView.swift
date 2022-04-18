//
//  ContentView.swift
//  Cards
//
//  Created by Metin Atalay on 18.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(0..<6) { item in
                    CardView(card: cardData[item])
                }
            } //: HSTACK
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
