//
//  AnimateView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct AnimateView: View {
    var body: some View {
        NavigationStack {
            Text("AnimateView")
                .navigationTitle("动画")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AnimateView()
}
