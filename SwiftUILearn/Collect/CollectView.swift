//
//  CollectView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct CollectView: View {
    var body: some View {
        NavigationStack {
            Text("CollectView")
                .navigationTitle("收藏")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CollectView()
}
