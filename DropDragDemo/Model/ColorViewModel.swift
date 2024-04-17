//
//  ColorViewModel.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import Foundation
import SwiftUI

class ColorViewModel: ObservableObject {
    //初始的顏色陣列
    @Published var colorArray = [
        ColorBlock(name: "Red", color: .red),
        ColorBlock(name: "Orange", color: .orange),
        ColorBlock(name: "Blue", color: .blue),
        ColorBlock(name: "Yellow", color: .yellow),
        ColorBlock(name: "Purple", color: .purple),
        ColorBlock(name: "Cyan", color: .cyan),
        ColorBlock(name: "Green", color: .green),
        ColorBlock(name: "Indigo", color: .indigo),
        ColorBlock(name: "Mint", color: .mint)
    ]
    
    @Published var currentColor: ColorBlock?
    
    //MARK: - function
    func deleteTapColor(colorIndex: Int) {
        colorArray.remove(at: colorIndex)
    }
    
    func addNewColor(colorName: String, color: Color) {
        colorArray.append(ColorBlock(name: colorName, color: color))
    }
    
}
