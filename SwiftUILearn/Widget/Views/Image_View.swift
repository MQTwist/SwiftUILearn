//
//  Image_View.swift
//  SwiftUILearn
//
//  Created by 马齐 on 2026/1/13.
//

import SwiftUI

struct Image_View: LearnView {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 1. 基本图片显示
                GroupBox(label: Text("基本图片").font(.headline)) {
                    Image("example_image") // 项目资源中的图片
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .border(Color.gray, width: 1)
                }
                
                // 2. 系统图标
                GroupBox(label: Text("系统图标").font(.headline)) {
                    HStack(spacing: 20) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                    .font(.title)
                    .padding()
                }
                
                // 3. 可缩放图片
                GroupBox(label: Text("可缩放图片").font(.headline)) {
                    Image("landscape") // 项目资源中的图片
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 150)
                        .clipped()
                        .cornerRadius(10)
                }
                
                // 4. 图片叠加效果
                GroupBox(label: Text("图片叠加").font(.headline)) {
                    ZStack {
                        Image("background") // 项目资源中的图片
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 150)
                            .blur(radius: 2)
                        
                        Text("叠加文字")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                    }
                    .cornerRadius(10)
                }
                
                // 5. 异步图片加载
                GroupBox(label: Text("异步加载").font(.headline)) {
                    AsyncImageView()
                }
            }
            .padding()
        }
    }
    
    var viewName: String {
        return "Image"
    }
}

// 异步图片加载组件
struct AsyncImageView: View {
    let url = URL(string: "https://picsum.photos/300/150")!
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
                    .imageScale(.large)
            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 150)
    }
}

#Preview {
    Image_View()
}
