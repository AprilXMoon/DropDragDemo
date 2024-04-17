//
//  ContentView.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var addNewColor = false
    @StateObject var colorVM = ColorViewModel()
    
    var body: some View {
        if !addNewColor {
            ColorCollectionView(viewModel: colorVM) {
                addNewColor = true
            }
        } else {
            AddColorView(viewModel: colorVM) {
                addNewColor = false
            }
        }
    }
}

#Preview {
    ContentView()
}
