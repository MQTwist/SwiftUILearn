//
//  TabbarOldStyle.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct TabbarOldStyle: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 内容区域
            TabView(selection: $selectedTab) {
                WidgetView()
                    .tag(0)
                
                CollectView()
                    .tag(1)
                
                AnimateView()
                    .tag(2)
                
                MeView()
                    .tag(3)
            }
            .tabViewStyle(.tabBarOnly)
            
            // 自定义底部 TabBar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

// MARK: - Custom TabBar

/// 自定义底部导航栏
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    /// TabBar 配置项
    private let tabItems: [(icon: String, title: String)] = [
        ("square.grid.2x2", "控件"),
        ("heart.fill", "收藏"),
        ("play.circle.fill", "动画"),
        ("person.fill", "我的")
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabItems.count, id: \.self) { index in
                TabBarButton(
                    icon: tabItems[index].icon,
                    title: tabItems[index].title,
                    isSelected: selectedTab == index
                ) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = index
                    }
                }
            }
        }
        .frame(height: 49)
        .background(.ultraThinMaterial)
        .overlay(alignment: .top) {
            Divider()
        }
    }
}

// MARK: - TabBar Button

/// TabBar 单个按钮
struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                
                Text(title)
                    .font(.system(size: 10))
            }
            .foregroundStyle(isSelected ? .blue : .secondary)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TabbarOldStyle()
}
