//
//  Tabbar.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            WidgetView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("控件")
                }
            
            CollectView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("收藏")
                }
            
            AnimateView()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("动画")
                }
            
            MeView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    Tabbar()
}
