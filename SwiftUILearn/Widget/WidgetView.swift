//
//  WidgetView.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/8.
//

import SwiftUI

struct WidgetView: View {
    @State private var items = ["Text", "Image", "Button"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .swipeActions(edge: .leading) {
                            Button("置顶") {
                                if let index = items.firstIndex(of: item) {
                                    items.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
                                }
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing) {
                            Button("编辑") {
                                // 编辑逻辑
                            }
                            .tint(.yellow)
                            
                            Button("删除") {
                                if let index = items.firstIndex(of: item) {
                                    items.remove(at: index)
                                }
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("基础控件")
        }
    }
}

#Preview {
    WidgetView()
}
