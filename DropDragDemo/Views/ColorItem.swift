//
//  ColorItem.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import SwiftUI

struct ColorItem: View {
    
    var colorBlock: ColorBlock
    
    var body: some View {
        ZStack {
            colorBlock.color
            Text(colorBlock.name)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ColorItem(colorBlock: ColorBlock(name: "Cyan", color: .cyan))
}
