//
//  Tabbar.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        NavigationView {
            TabView {
                WidgetView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Widget")
                    }
                
                CollectView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Collect")
                    }
                
                AnimateView()
                    .tabItem {
                        Image(systemName: "play.circle.fill")
                        Text("Animate")
                    }
                
                MeView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Me")
                    }
            }
            .accentColor(.blue)
        }
    }
}

#Preview {
    Tabbar()
}
