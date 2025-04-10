//
//  CreditCardView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct CreditCardView: View {
    let cardNumber: String
    let name: String
    let expireMonth: Int
    let expireYear: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
            
            VStack(alignment: .leading) {
                HStack {
                    Image("GoldChip")
                        .resizable()
                        .frame(width: 25*4/3, height: 25)
                        .padding()
                    
                    Spacer()
                }
                
                Text(cardNumber)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Expiry Date")
                                .font(.caption2)
                                .fontWeight(.thin)
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                            
                            Text(verbatim: "\(expireMonth)/\(expireYear)")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack(spacing: -10) {
                            Circle()
                                .fill(.red)
                                .frame(width: 30, height: 30)
                                .zIndex(1)
                                .shadow(radius: 5)
                                .opacity(0.8)
                            
                            Circle()
                                .fill(.orange)
                                .frame(width: 30, height: 30)
                                .shadow(radius: 5)
                                .opacity(0.8)
                        }
                        
                        Text("Mastercard")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    CreditCardView(cardNumber: "4562 1122 4595 7852", name: "Ron Erez", expireMonth: 12, expireYear: 2028)
}
