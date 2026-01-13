//
//  Textfield_View.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/13.
//

import SwiftUI

struct Textfield_View: LearnView {
    // 1. 基本TextField绑定
    @State private var username: String = ""
    
    // 2. 格式化输入
    @State private var phoneNumber: String = ""
    
    // 3. 安全输入
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    // 4. 输入验证
    @State private var email: String = ""
    private var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }
    
    // 5. 键盘控制
    enum Field: Hashable {
        case username, phone, email, password
    }
    @FocusState private var focusedField: Field?
    
    var body: some View {
        Form {
            // 1. 基本TextField
            Section("基本输入框") {
                TextField("请输入用户名", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .phone
                    }
            }
            
            // 2. 格式化输入
            Section("电话号码格式化") {
                TextField("请输入电话号码", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                    .focused($focusedField, equals: .phone)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .email
                    }
            }
            
            // 3. 安全输入
            Section("密码输入") {
                if showPassword {
                    TextField("密码", text: $password)
                } else {
                    SecureField("密码", text: $password)
                }
                
                Toggle("显示密码", isOn: $showPassword)
            }
            
            // 4. 输入验证
            Section("邮箱验证") {
                TextField("请输入邮箱", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                    }
                
                if !email.isEmpty {
                    Text(isEmailValid ? "✅ 邮箱格式正确" : "❌ 邮箱格式不正确")
                        .foregroundColor(isEmailValid ? .green : .red)
                }
            }
            
            // 5. 显示输入结果
            Section("输入结果") {
                Text("用户名: \(username)")
                Text("电话: \(phoneNumber)")
                Text("邮箱: \(email)")
                Text("密码: \(password.isEmpty ? "未输入" : "已输入")")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("完成") {
                    focusedField = nil
                }
            }
        }
    }
    var viewName: String {
        return "Textfield"
    }
    
}

#Preview {
    Textfield_View()
}
