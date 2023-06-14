//
//  View+LayerEffect.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import SwiftUI

// Layer Effect Shader

extension View {
    func gradientSubtract(isEnabled: Bool = true) -> some View {
        self.layerEffect(
            ShaderLibrary.default.gradientSubtract(.boundingRect),
            maxSampleOffset: .zero,
            isEnabled: isEnabled
        )
    }
}
