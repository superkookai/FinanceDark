//
//  FillBarView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct FillBarView: View {
    let barWidth: CGFloat = 8
    let month: String
    let percentage: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(month)
                    .foregroundStyle(ColorConstants.fontColor)
                    .font(.caption)
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(ColorConstants.backgroundX)
                        .frame(width: barWidth, height: .infinity)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple2)
                        .frame(width: barWidth, height: geo.size.height*percentage)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        ColorConstants.darkBackground.ignoresSafeArea()
        FillBarView(month: "Jan", percentage: 0.7)
    }
}
