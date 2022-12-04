//
//  ProductDetailsView.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import SwiftUI

struct ProductDetailsView: View {
    
    var product: Product?
    
    @Binding var isShown: Bool
    
    var body: some View {
        HalfModalView(isShown: $isShown, content: {
            VStack{
                ModalHandlerView(toggleDisplay: $isShown)
                
                VStack(spacing: 16){
                    
                    Text(product?.name ?? "").font(alexandria18).fontWeight(.bold).foregroundColor(.accentColor)
                    
                    ScrollView{
                        
                        VStack(spacing: 32){
                            
                            switch product?.productType{
                                case .product:
                                    NetworkImage(imageURL: product?.imageURL ?? "",width: 50, height: 50, displayPlaceholderBackground: false, contentMode: .fit)
                                case .digioCash:
                                    NetworkImage(imageURL: product?.imageURL ?? "", width: 350, height: 100, cornerRadius: 8, displayPlaceholderBackground: false, contentMode: .fill)
                                default:
                                    NetworkImage(imageURL: product?.imageURL ?? "",height: 160, cornerRadius: 8, displayPlaceholderBackground: false)
                            }
                            Text(product?.productDescription ?? "")
                            
                        }
                    }
                    
                }
            }
        })
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: .init(name: "Teste", imageURL: "", productDescription: ""), isShown: .constant(true))
    }
}
