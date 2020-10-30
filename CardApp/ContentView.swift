//
//  ContentView.swift
//  CardApp
//
//  Created by 山本 沙季 on 2020/10/23.
//  Copyright © 2020 山本 沙季. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var cards = ["かばん": "bag",
                 "自動車": "car",
                 "誕生日": "birthday",
                 "ペン": "pen"]
    @State var japanese = "かばん"
    @State var isJapanese = true
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.56)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("card")
                        .resizable()
                        .frame(width: 300.0, height: 133.0)
                        .shadow(radius: 3)
                        .rotation3DEffect(.degrees(isJapanese ? 0:180), axis: (x:0,y:1,z:0))
                        .animation(.spring())
                        .onTapGesture {
                            self.isJapanese.toggle()
                    }
                    Text(isJapanese ? japanese : cards[japanese]!)
                }
                HStack {
                    Button(action: {self.isJapanese.toggle()}) {
                        Text(/*@START_MENU_TOKEN@*/"裏返す"/*@END_MENU_TOKEN@*/)
                    }
                    Button(action: {self.isJapanese = true
                        self.japanese = self.cards.randomElement()!.key
                    }) {
                        Text(/*@START_MENU_TOKEN@*/"次へ"/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
