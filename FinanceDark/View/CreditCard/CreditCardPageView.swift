//
//  CreditCardPageView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct CreditCardPageView: View {
    
    var body: some View {
        ZStack {
            ColorConstants.darkBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                TopView()
                
                YourCardsView(numOfActiveCards: 3)
                
                CreditCardView(cardNumber: "4562 1122 4595 7852", name: "Ron Erez", expireMonth: 12, expireYear: 2028)
                
                
                TextView(text: "Recent Transactions", font: .title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        ForEach(0..<demoTransactions.count, id:\.self) { i in
                            TransactionView(
                                imageName: demoTransactions[i].0,
                                payTo: demoTransactions[i].1,
                                month: demoTransactions[i].2,
                                day: demoTransactions[i].3,
                                amount: demoTransactions[i].4,
                                isExpense: demoTransactions[i].5,
                                isSystemIcon: demoTransactions[i].6
                            )
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    CreditCardPageView()
}

let demoTransactions: [(imageName: String?,
                    payTo: String,
                    month: Int,
                    day: Int,
                    amount: Int,
                    isExpense: Bool,
                    isSystemIcon: Bool)] = [
                        
                        (imageName: "fork.knife",
                         payTo: "KFC",
                         month: 3,
                         day: 20,
                         amount: 2000,
                         isExpense: true,
                         isSystemIcon: true),
                        (imageName: "bolt",
                         payTo: "Electric",
                         month: 4,
                         day: 25,
                         amount: 3500,
                         isExpense: true,
                         isSystemIcon: true),
                        (imageName: "drop",
                         payTo: "Water",
                         month: 7,
                         day: 21,
                         amount: 310,
                         isExpense: true,
                         isSystemIcon: true),
                        (imageName: "film",
                         payTo: "Netflix",
                         month: 11,
                         day: 25,
                         amount: 349,
                         isExpense: true,
                         isSystemIcon: true)
                    ]
