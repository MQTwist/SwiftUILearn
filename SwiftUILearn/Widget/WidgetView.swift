//
//  WidgetView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

/// 基本控件展示页面
struct WidgetView: View {
    
    // MARK: - Properties
    
    /// 控件列表数据源 - 新增控件只需在这里添加即可
    @State private var widgetItems: [any LearnView] = [
        Text_View(),
        Button_View(),
        Image_View(),
        Textfield_View(),
        TextEditor_View()
    ]
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(widgetItems, id: \.viewName) { item in
                    NavigationLink {
                        AnyView(item)
                            .navigationTitle(item.viewName)
                            .toolbarVisibility(.hidden, for: .tabBar)
                    } label: {
                        WidgetListRowView(
                            title: item.viewName,
                            description: item.viewDescription,
                            iconName: item.iconName
                        )
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("基本控件")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Widget List Row View

/// 控件列表行视图
struct WidgetListRowView: View {
    let title: String
    let description: String
    let iconName: String
    
    var body: some View {
        HStack(spacing: 12) {
            // 图标
            Image(systemName: iconName)
                .font(.system(size: 22))
                .foregroundStyle(.blue)
                .frame(width: 32, height: 32)
            
            // 标题和描述
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.primary)
                
                if !description.isEmpty {
                    Text(description)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview

#Preview {
    WidgetView()
}
