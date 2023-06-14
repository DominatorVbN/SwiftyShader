//
//  SwiftyShaderView.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import SwiftUI

struct SwiftyShaderView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Color Effect") {
                    NavigationLink("Aqua Shader") {
                        AquaShaderView()
                    }
                    NavigationLink("Gradientify Shader") {
                        GradientifyShaderView()
                    }
                    NavigationLink("Remove Red") {
                        RemoveRedShaderView()
                    }
                }
                Section("Layer Effect") {
                    NavigationLink("Gradient Substract Shader") {
                        GradientSubstractShaderView()
                    }
                }
            }
            .navigationTitle("Swifty Shaders")
        }
    }
}

#Preview {
    SwiftyShaderView()
}
