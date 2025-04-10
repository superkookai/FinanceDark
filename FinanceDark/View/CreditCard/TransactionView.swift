//
//  TransactionView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct TransactionView: View {
    let imageName: String?
    let payTo: String
    let month: Int
    let day: Int
    let amount: Int
    let isExpense: Bool
    let isSystemIcon: Bool
    
    var body: some View {
        HStack {
            if let imageName {
                Image(systemName: imageName)
                    .font(.title.bold())
            }
            
            VStack(alignment: .leading, spacing: 7) {
                Text(payTo)
                    .font(.title2)
                
                if month >= 0 && month < 12 {
                    let calendar = Calendar.current
                    let monthName = calendar.monthSymbols[month]
                    
                    Text("\(monthName)/\(day)")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text(isExpense ? "-$\(amount)" : "+$\(amount)")
                .font(.title3)
        }
        .foregroundStyle(ColorConstants.fontColor)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.backgroundX)
        )
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        TransactionView(
            imageName: nil,
            payTo: "KFC",
            month: 3,
            day: 20,
            amount: 2000,
            isExpense: true,
            isSystemIcon: true
        )
        
        TransactionView(
            imageName: "bolt",
            payTo: "Electric",
            month: 4,
            day: 25,
            amount: 3500,
            isExpense: true,
            isSystemIcon: true
        )
        
        TransactionView(
            imageName: "bolt",
            payTo: "Water",
            month: 7,
            day: 21,
            amount: 310,
            isExpense: true,
            isSystemIcon: true
        )
        
        TransactionView(
            imageName: "bolt",
            payTo: "Netflix",
            month: 11,
            day: 25,
            amount: 349,
            isExpense: true,
            isSystemIcon: true
        )
    }
}
