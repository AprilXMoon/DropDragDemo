//
//  ColorCollectionView.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import SwiftUI

struct ColorCollectionView: View {
    
    @StateObject var viewModel: ColorViewModel
    
    let action: () -> Void
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.colorArray) { item in
                        ColorItem(colorBlock: item)
                            .frame(height: 100)
                            .onDrag{
                                viewModel.currentColor = item
                                return NSItemProvider(item: nil, typeIdentifier: item.id)
                                //NSItemProvider(contentsOf: URL(string: item.id)!)!
                            }
                            .onDrop(of: [.item] , delegate: DropDragViewDelegate(colorBlock: item, colorVM: viewModel))
                        
                    }
                })
            }
            .padding()
            
            Button{
                action()
            }label: {
                Text("建立顏色")
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 60)
                    .background(.green.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    ColorCollectionView(viewModel: ColorViewModel()) {
        
    }
}
