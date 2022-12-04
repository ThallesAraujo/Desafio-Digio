//
//  ErrorView.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import SwiftUI

struct ErrorView: View {
    
    var tryAgainClosure: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Spacer()
            
            Image(systemName: "wifi.exclamationmark").font(.system(size: 62)).foregroundColor(.red)

            Text("Ocorreu um erro. Verifique sua conexão e tente novamente.").font(alexandria18).multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: tryAgainClosure, label: {
                Text("Recarregar").font(alexandria18).padding().frame(maxWidth: .infinity)
            }).buttonStyle(.borderedProminent)
            
        }.padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(tryAgainClosure: {})
    }
}
