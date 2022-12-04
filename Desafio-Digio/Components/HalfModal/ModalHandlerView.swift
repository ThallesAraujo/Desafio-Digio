//
//  ModalHandlerView.swift
//
//  Created by Thalles Araújo on 26/05/22.
//

import SwiftUI

struct ModalHandlerView: View {
    
    @Binding var toggleDisplay: Bool
    @Environment(\.dismiss) private var dismiss
    
    var onDismiss : (() -> Void)?
    
    var body: some View {
        HStack{
            Spacer()
            RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color.init(UIColor.secondarySystemFill.cgColor)).frame(width: 40, height: 8).offset(x: 20, y: -10)
            Spacer()
            
            
            Button(action: {
                withAnimation(.easeInOut){
                    $toggleDisplay.wrappedValue.toggle()
                    
                    if let onDismiss = onDismiss {
                        onDismiss()
                    }
                }
            }, label: {
                Image(systemName: "xmark").font(.system(size: 18, weight: .bold)).foregroundColor(.secondary)
            }).buttonStyle(.bordered).clipShape(Circle()).offset(x: 8)
        }.frame(width: .infinity)
    }
}

struct ModalHandlerView_Previews: PreviewProvider {
    static var previews: some View {
        ModalHandlerView(toggleDisplay: .constant(true))
    }
}
