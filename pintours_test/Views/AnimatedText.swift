//
//  AnimatedText.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import SwiftUI

struct AnimatedText: View {
    var text: String
    var weight: Font.Weight = .regular
    var fontSize: Font = .body
    
    // MARK: - Body
    var body: some View {
        Text(text)
            .font(fontSize)
            .customAttribute(EmphasisAttribute())
            .fontDesign(.rounded)
            .fontWeight(weight)
            .transition(TextTransition())
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(.gray)
            
    }
}
