//
//  Button_View.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/13.
//

import SwiftUI

struct Button_View: LearnView {
    var body: some View {
        VStack(spacing: 10, content: {
            // 1. 基础文字按钮
            Button("点击我") {
                print("基础按钮被点击")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            // 2. 带图标的按钮
            Button(action: {
                print("图标按钮被点击")
            }) {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("喜欢")
                }
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            // 3. 自定义样式的按钮
            Button(action: {
                print("自定义按钮被点击")
            }) {
                Text("自定义样式")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple, .blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            
            PressEffectButton(text: "按压效果")
        })
    }
    
    var viewName: String {
        return "Button"
    }
}

// 带按压效果的按钮组件
struct PressEffectButton: View {
    @State private var isPressed = false
    let text: String
    
    
    var body: some View {
        Button(action: {
            print("按压效果按钮被点击")
        }) {
            Text(text)
                .padding()
                .background(isPressed ? Color.gray : Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

#Preview {
    Button_View()
}
