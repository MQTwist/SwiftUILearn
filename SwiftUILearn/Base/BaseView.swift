//
//  BaseView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/12.
//

import SwiftUI

/// 学习视图协议 - 所有控件演示页面都需遵循此协议
public protocol LearnView: View {
    /// 控件名称
    var viewName: String { get }
    /// 控件描述
    var viewDescription: String { get }
    /// 控件图标
    var iconName: String { get }
}

extension LearnView {
    /// 默认描述为空
    var viewDescription: String {
        return ""
    }
    
    /// 默认图标
    var iconName: String {
        return "app.fill"
    }
}




