//
//  NetworkImage.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import SwiftUI

struct NetworkImage: View {
    
    var imageURL: String
    var width: CGFloat?
    var height: CGFloat?
    var cornerRadius: CGFloat?
    
    var displayPlaceholderBackground: Bool = true
    var contentMode: ContentMode = .fit
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL)){ phase in
            switch phase {
            case .empty:
                placeholderView
            case .success(let image):
                image.resizable().aspectRatio(contentMode: contentMode).frame(width: width, height: height).cornerRadius(cornerRadius ?? 8)
            case .failure:
                Image(systemName: "shippingbox").foregroundColor(.accentColor).font(.system(size: 24))
            @unknown default:
                placeholderView
            }
        }
    }
    
    var placeholderView: some View{
        ZStack{
            if displayPlaceholderBackground{
                RoundedRectangle(cornerRadius: cornerRadius ?? 8).fill(Color.white).frame(width: width, height: height).shadow(color: .black.opacity(0.2), radius: 4, x: 3, y: 3).padding(4)
            }
            
            Image(systemName: "hourglass").foregroundColor(.accentColor).font(.system(size: 24))
        }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageURL: "")
    }
}
