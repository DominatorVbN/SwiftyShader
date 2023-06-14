//
//  AquaShaderView.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import SwiftUI

struct AquaShaderView: View {
    @State var isShaderEnabled = true
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Enable Shader", isOn: $isShaderEnabled)
            }
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.pink)
                .aqua(isEnabled: isShaderEnabled)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .padding()
        .navigationTitle("Aqua")
    }
}

#Preview {
    AquaShaderView()
}
