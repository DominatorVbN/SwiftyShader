//
//  Shaders.metal
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 aqua(
                            float2 position,
                            half4 color
                            ) {
                                // R, G, B, A
                                return half4(60.0/255.0, 238.0/255.0, 227.0/255.0, 1.0);
                            }

[[ stitchable ]] half4 gradientify(
                                   float2 position,
                                   half4 color,
                                   float4 box,
                                   float secs
                                   ) {
                                       // Normalised pixel coords from 0 to 1
                                       // Gives us something like (0.4, 0,2)
                                       vector_float2 uv = position/box.zw;
                                       
                                       // Calculate color as a function of the position & time
                                       // Start from 0.5 to brighten the colors ( we don't want this to be dark )
                                       // The rest of the color components should be a percentage of whatever is left of 0.5.
                                       // To make this brighter, increase the first value.
                                       vector_float3 col = 0.5 + 0.5 * cos( secs + uv.xyx + float3(0, 2, 4) );
                                       return half4(col.x, col.y, col.z, 1);
                                   }

[[ stitchable ]] half4 removeRed(
                                 float2 position,
                                 half4 color
                                 ) {
                                     // ignore the red provided
                                     color.x = 0;
                                     return color;
                                 }

[[ stitchable ]] half4 gradientSubtract(
                                         float2 position,
                                         SwiftUI::Layer layer,
                                         float4 bounds
                                         ) {
                                             // Normalise coordinates
                                             // This time we're taking a float2 out of a float4, which we do with zw
                                             float2 uv = position / bounds.zw;
                                             
                                             // Get our pixel color
                                             half4 pixelColor = layer.sample(position);
                                             
                                             // Alter this number to affect how close this will be to the base color
                                             float offset = 0.5;
                                             
                                             // Remove from the base color, returning a new color
                                             return pixelColor - half4(uv.x * offset, uv.y * offset, 0, 0);
                                             
                                         }
