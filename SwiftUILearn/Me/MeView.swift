//
//  MeView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        NavigationStack {
            Text("MeView")
                .navigationTitle("我的")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MeView()
}
