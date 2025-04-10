//
//  YourBalanceView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct YourBalanceView: View {
    
    var body: some View {
        ZStack {
            ColorConstants.darkBackground
                .ignoresSafeArea()
            
            VStack {
                HeaderYourBalanceView()
                
                BalanceSubView()
                
                YourBalanceAmountView(
                    month: 6,
                    day: 14,
                    year: 2022,
                    amount: 27802.05,
                    percentage: 15,
                    isUp: true)
                
                YourBalanceActionsView()
                
                ActivityOfTheWeekHeader()
                
                MonthlyExpensesView()
            }
        }
    }
}

#Preview {
    YourBalanceView()
}

//MARK: - SubViews

struct HeaderYourBalanceView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3.decrease")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(ColorConstants.fontColor)
                .background(ColorConstants.backgroundX)
            
            Spacer()
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(ColorConstants.fontColor)
                .background(ColorConstants.backgroundX)
                .clipShape(.circle)
        }
        .padding(.horizontal)
    }
}

struct BalanceSubView: View {
    var body: some View {
        HStack {
            TextView(text: "Your Balance", font: .title)
            Spacer()
        }
        .padding([.top,.horizontal])
        .padding(.bottom,0)
    }
}

struct YourBalanceAmountView: View {
    let month: Int
    let day: Int
    let year: Int
    let amount: Double
    let percentage: Int
    let isUp: Bool
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                if month >= 0 && month < 12 {
                    let calendar = Calendar.current
                    let monthName = calendar.monthSymbols[month]
                    
                    HStack {
                        TextView(text: "\(monthName) \(day), \(year)", font: .caption)
                        Spacer()
                    }
                }
                
                HStack {
                    Text("$\(amount, specifier: "%.2f")")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextView(text: "\(percentage)%", font: .caption)
                    
                    Image(systemName: isUp ? "arrow.up" : "arrow.down")
                        .foregroundStyle(ColorConstants.fontColor)
                        .imageScale(.large)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorConstants.backgroundX)
        )
        .padding(.horizontal)
    }
}

struct YourBalanceActionsView: View {
    let actionList: [(iconName: String, name: String, color: Color)] = [
        (iconName: "arrow.up", name: "Sent", color: .pink),
        (iconName: "arrow.down", name: "Receive", color: .green),
        (iconName: "dollarsign.square", name: "Loan", color: .yellow),
        (iconName: "icloud.and.arrow.up", name: "Topup", color: .blue)
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<actionList.count-1, id: \.self) { i in
                ActionView(iconName: actionList[i].iconName, color: actionList[i].color, name: actionList[i].name)
                
                Spacer()
            }
            
            ActionView(iconName: actionList[actionList.count-1].iconName, color: actionList[actionList.count-1].color, name: actionList[actionList.count-1].name)
        }
        .padding()
    }
}

struct ActionView: View {
    let iconName: String
    let color: Color
    let name: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundStyle(color)
                .frame(width: 50, height: 50)
                .background(ColorConstants.backgroundX)
                .clipShape(.rect(cornerRadius: 15))
            
            TextView(text: name, font: .body)
        }
    }
}

struct ActivityOfTheWeekHeader: View {
    var body: some View {
        HStack {
            TextView(text: "Activities", font: .title3.weight(.semibold))
                
            Spacer()
            
            TextView(text: "This Week", font: .caption)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(ColorConstants.backgroundX)
                )
        }
        .padding()
    }
}

struct MonthlyExpensesView: View {
    let barData: [(name: String,percentage: CGFloat)] = [
        (name: "Jan", percentage: 0.33),
        (name: "Feb", percentage: 0.33),
        (name: "Mar", percentage: 0.33),
        (name: "Apr", percentage: 0.33/2),
        (name: "May", percentage: 0.33/2),
        (name: "Jun", percentage: 0.33/2)
    ]

    var body: some View {
        HStack {
            ForEach(barData.indices, id: \.self) { i in
                FillBarView(month: barData[i].name, percentage: barData[i].percentage)
            }
        }.padding()
    }
}
