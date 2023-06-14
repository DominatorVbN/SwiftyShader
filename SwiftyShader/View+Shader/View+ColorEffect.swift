//
//  View+ColorEffect.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import SwiftUI

// Color Effect Shader
extension View {
    
    func aqua(isEnabled: Bool = true) -> some View {
        let shaderFunction = ShaderFunction(
            library: .default,
            name: "aqua"
        )
        let shader = Shader(function: shaderFunction, arguments: [])
        return self.colorEffect(shader, isEnabled: isEnabled)
    }
    
    func gradientEffect(seconds: Double, isEnabled: Bool = true) -> some View {
        let function = ShaderFunction(
            library: .default,
            name: "gradientify"
        )
        let shader = Shader(
            function: function,
            arguments: [
                .boundingRect,
                .float(seconds)
            ]
        )
        return self.colorEffect(shader, isEnabled: isEnabled)
    }
    
    func removeRed(isEnabled: Bool = true) -> some View {
        let function = ShaderFunction(
            library: .default,
            name: "removeRed"
        )
        let shader = Shader(function: function, arguments: [])
        return self.colorEffect(shader, isEnabled: isEnabled)
    }
    
}
