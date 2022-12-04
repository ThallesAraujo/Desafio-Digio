//
//  LoadingView.swift
//  ThallesSwiftUtils
//
//  Created by Thalles Araújo on 08/06/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().scaleEffect(2.5).progressViewStyle(.circular).tint(.accentColor).padding(40).background(.regularMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

