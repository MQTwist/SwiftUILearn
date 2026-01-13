//
//  TextEditor_View.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/13.
//

import SwiftUI

struct TextEditor_View: LearnView {
    // 1. 基本TextEditor
    @State private var text: String = "请在此输入多行文本..."
    
    // 2. 带字数限制
    @State private var limitedText: String = ""
    private let maxChars: Int = 100
    
    // 3. 带样式定制
    @State private var styledText: String = ""
    @State private var fontSize: CGFloat = 16
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 基础TextEditor
                GroupBox("基本TextEditor") {
                    TextEditor(text: $text)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                }
                
                // 带字数限制
                GroupBox("带字数限制") {
                    TextEditor(text: $limitedText)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                        .onChange(of: limitedText, { oldValue, newValue in
                            if newValue.count > maxChars {
                                limitedText = String(newValue.prefix(maxChars))
                            }
                        })
                    
                    Text("\(limitedText.count)/\(maxChars)")
                        .foregroundColor(limitedText.count >= maxChars ? .red : .gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // 带样式定制
                GroupBox("带样式定制") {
                    TextEditor(text: $styledText)
                        .frame(height: 150)
                        .font(.system(size: fontSize))
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    
                    Stepper("字体大小: \(Int(fontSize))", value: $fontSize, in: 12...32)
                }
                
                // 自动调整高度的TextEditor
                GroupBox("自动调整高度") {
                    AutoSizingTextEditor(text: .constant("输入时自动调整高度..."))
                        .frame(minHeight: 50, maxHeight: 200)
                        .border(Color.gray, width: 1)
                }
            }
            .padding()
        }
        .navigationTitle("TextEditor示例")
    }
    
    var viewName: String {
        return "TextEditor"
    }
}

struct AutoSizingTextEditor: View {
    @Binding var text: String
    
    var body: some View {
        TextEditor(text: $text)
            .frame(minHeight: 20)
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: ViewHeightKey.self,
                    value: geometry.size.height
                )
            })
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


#Preview {
    TextEditor_View()
}
