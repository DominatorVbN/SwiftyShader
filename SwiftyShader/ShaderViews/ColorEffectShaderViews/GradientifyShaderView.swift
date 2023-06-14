//
//  GradientifyShaderView.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import SwiftUI

struct GradientifyShaderView: View {
    @State var isShaderEnabled = true
    let start = Date()
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Enable Shader", isOn: $isShaderEnabled)
            }
            TimelineView(.animation) { ctx in
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(.pink)
                    .gradientEffect(
                        seconds: ctx.date.timeIntervalSince1970  - self.start.timeIntervalSince1970,
                        isEnabled: isShaderEnabled
                    )
                    .overlay {
                        VStack {
                            Text("<3")
                                .font(.largeTitle.bold())
                                .fontDesign(.rounded)
                                .foregroundStyle(.white.gradient)
                        }
                        .blendMode(.sourceAtop)
                        .opacity(0.8)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
        .padding()
        .navigationTitle("Gradientify")
    }
}

#Preview {
    GradientifyShaderView()
}
