//
//  AboutView.swift
//  FinanceDark
//
//  Created by Weerawut Chaiyasomboon on 10/04/2568.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            ColorConstants.darkBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                XView()
                
                AvatarView()
                
                ChoicesView()
                    
                Spacer()
            }
        }
    }
}


//MARK: - Subviews
struct ChoicesView: View {
    let dataArray: [(String,String,String?)] = [
        (title:"Corporate App", systemImage: "building.2", description: nil),
        (title:"Security Settings", systemImage: "lock", description: nil),
        (title:"Online Shopping", systemImage: "cart", description: "Add to cart"),
        (title:"Groceries", systemImage: "list.bullet.rectangle", description: nil),
        (title:"Utilities", systemImage: "wrench.and.screwdriver", description: nil),
        (title:"Thumb Scanner", systemImage: "hand.thumbsup", description: "Scan thumb for identification")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<dataArray.count, id: \.self) { i in
                SingleChoiceView(text: dataArray[i].0, systemImage: dataArray[i].1, description: dataArray[i].2)
            }
        }
    }
}

struct SingleChoiceView: View {
    let text: String
    let systemImage: String
    let description: String?
    
    var body: some View {
        Label(text, systemImage: systemImage)
            .font(.headline)
            .foregroundStyle(ColorConstants.fontColor)
            .padding()
            .labelStyle(SpaceLabelStyle())
            .symbolRenderingMode(.hierarchical)
            .accessibilityLabel(description ?? text)
    }
}

struct SpaceLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 20) {
            configuration.icon
                .imageScale(.large)
            configuration.title
        }
    }
}

struct TextView: View {
    let text: String
    var font: Font = .title
    
    var body: some View {
        Text(text)
            .font(font)
            .foregroundStyle(ColorConstants.fontColor)
    }
}

struct AvatarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(ColorConstants.fontColor)
                .background(ColorConstants.backgroundX)
                .clipShape(.circle)
            
            TextView(text: "Ron Erez")
            
            TextView(text: "UX/UI Designer", font: Font.headline)
        }
        .padding(.leading)
    }
}

struct XView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundStyle(ColorConstants.fontColor)
                .padding(10)
                .background(ColorConstants.backgroundX)
                .clipShape(.circle)
        }
        .padding(.trailing)
    }
}

#Preview {
    AboutView()
}
