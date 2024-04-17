//
//  DropDragViewDelegate.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import Foundation
import SwiftUI

struct DropDragViewDelegate: DropDelegate {
    
    var colorBlock: ColorBlock
    
    var colorVM: ColorViewModel
    
    //MARK: - DropDelegate
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropEntered(info: DropInfo) {
        
        print(colorBlock.name)
        
        let fromColorIndex = colorVM.colorArray.firstIndex {
            return $0.name == colorVM.currentColor?.name
        }
        
        let toColorIndex = colorVM.colorArray.firstIndex {
            return $0.name == colorBlock.name
        }
        
        guard let fromIndex = fromColorIndex, let toIndex = toColorIndex else {
            return
        }
        
        if fromColorIndex != toColorIndex {
            withAnimation {
                colorVM.colorArray.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? (toIndex + 1) : toIndex )
            }
        }
    }
    
}
