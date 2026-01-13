//
//  Text_View.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/12.
//

import SwiftUI

/// Text 控件演示页面
struct Text_View: LearnView {
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
            Text("字体")
                .font(.largeTitle)
            Text("颜色")
                .foregroundStyle(.red)
            Text("字体颜色")
                .font(.title)
                .foregroundStyle(.red)
            Text("字体字重权重颜色")
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
                .foregroundStyle(.yellow)
        }
    }
    
    // MARK: - LearnView Protocol
    
    var viewName: String {
        return "Text"
    }
    
    var viewDescription: String {
        return "文本显示控件"
    }
    
    var iconName: String {
        return "textformat"
    }
    
    
}

#Preview {
    Text_View()
}
