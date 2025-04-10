//
//  TopView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .fontWeight(.heavy)
                .frame(width: 50, height: 50)
                .foregroundStyle(ColorConstants.fontColor)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .fontWeight(.heavy)
                .frame(width: 50, height: 50)
                .foregroundStyle(ColorConstants.fontColor)
                .rotationEffect(.degrees(90))
        }
        .padding()
        .background(ColorConstants.darkBackground)
    }
}

#Preview {
    TopView()
}
