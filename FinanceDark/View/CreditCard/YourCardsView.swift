//
//  YourCardsView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct YourCardsView: View {
    let numOfActiveCards: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                TextView(text: "Your Cards", font: .title3)
                    .fontWeight(.bold)
                
                TextView(text: "Your have \(numOfActiveCards) Active cards", font: .caption)
                    .fontWeight(.thin)
            }
            
            Spacer()
            
            Image(systemName: "plus")
                .bold()
                .imageScale(.large)
                .foregroundStyle(ColorConstants.darkBackground)
                .padding(6)
                .background(.gold)
                .clipShape(.circle)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.darkBackground)
        )
        .padding(.horizontal)
    }
}

#Preview {
    YourCardsView(numOfActiveCards: 3)
}
