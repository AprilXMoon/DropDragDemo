//
//  ColorModel.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import Foundation
import SwiftUI

struct ColorBlock: Identifiable {
    var id = UUID().uuidString
    var name: String
    var color: Color
}
