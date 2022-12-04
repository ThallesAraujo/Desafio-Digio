//
//  ProductListViewModel.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import Foundation
import SwiftUI
class ProductListViewModel: ObservableObject{
    
    @Published var productList: ProductList = .init(spotlight: [], products: [], cash: .init(title: "", bannerURL: "", cashDescription: ""))
    
    @Published var showError: Bool = false
    
    @Published var isLoading: Bool = false
    
    func getProductList(){
        
        isLoading = true
        
        guard NetworkTester().isConnected() else{
            self.isLoading = false
            self.showError = true
            return
        }
        
        do{
            try URLSession.shared.dataTask(with: APIUrls.getProducts.request()) { data, response, error in
                
                if let dataUnwrapped = data{
                    if let products = try? JSONDecoder().decode(ProductList.self, from: dataUnwrapped){
                        DispatchQueue.main.async {
                            self.showError = false
                            self.productList = products
                            self.isLoading = false
                        }
                        print("Produtos: ")
                        dump(products)
                    }else{
                        print("JSON Inválido")
                        DispatchQueue.main.async {
                            self.showError = true
                            self.isLoading = false
                        }
                    }
                }
                
            }.resume()
        }catch _{
            self.showError = true
            self.isLoading = false
        }
        
    }
    
    
    
    
    
}
