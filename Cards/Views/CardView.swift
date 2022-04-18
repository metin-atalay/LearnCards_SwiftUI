//
//  CardView.swift
//  Cards
//
//  Created by Metin Atalay on 18.04.2022.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROP
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var card: Card
    
    var gradiant: [Color] = [Color("Color01"),Color("Color02")]
    
    // MARK: - CARD
    var body: some View {
        ZStack {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .opacity(fadeIn ? 1 : 0.0)
            
            VStack {
                Text(card.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218: -300)
            
            
            Button {
                print("button was tapped.")
                showAlert.toggle()
            } label: {
                HStack {
                    
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors ), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            } //: BUTTOM
            .offset(y: moveUpward ? 210: 300)
        } //: ZSTACK
        .frame(width: 335, height: 545)
        .cornerRadius(16)
        .shadow(radius: 8)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK"))
            )
        }
        
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[4])
            .previewLayout(.sizeThatFits)
    }
}
