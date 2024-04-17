//
//  AddColorView.swift
//  DropDragDemo
//
//  Created by April Lee on 2024/4/16.
//

import SwiftUI

struct AddColorView: View {
    
    @StateObject var viewModel: ColorViewModel
    
    let action: () -> Void
    
    //三原色slider Binding的值
    @State var redValue = 0.3
    @State var greenValue = 0.3
    @State var blueValue = 0.3
    
    @State var inputColorName = ""
    
    var body: some View {
        
        ZStack {
           
            
            VStack {
                HStack {
                    TextField("顏色別稱", text: $inputColorName)
                    
                }
                .textFieldStyle(.automatic)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 3)
                )
                
                Color(red: redValue*255/255, green: greenValue*255/255, blue: blueValue*255/255)
                
                Slider(value: $redValue, in: 0...1)
                    .padding()
                    .tint(.red)
                
                Slider(value: $greenValue, in: 0...1)
                    .padding()
                    .tint(.green)
                
                Slider(value: $blueValue, in: 0...1)
                    .padding()
                    .tint(.blue)
                
                Button {
                    viewModel.addNewColor(colorName: inputColorName, color:Color(red: redValue*255/255, green: greenValue*255/255, blue: blueValue*255/255))
                    action()
                } label: {
                    Text("建立新設定顏色")
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 60, alignment: .center)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddColorView(viewModel: ColorViewModel()) {
        
    }
}
