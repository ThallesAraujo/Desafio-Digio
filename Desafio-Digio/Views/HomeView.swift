//
//  HomeView.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    @State var toggleProductDetail: Bool = false
    
    @State var product: Product?
    
    var body: some View {
        ZStack{
            
            if $viewModel.isLoading.wrappedValue{
                LoadingView()
            }else if $viewModel.showError.wrappedValue{
                ErrorView(tryAgainClosure: viewModel.getProductList)
            }else{
                VStack(spacing: 32){
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach($viewModel.productList.spotlight.wrappedValue, id: \.self) { spotlightItem in
                                Button(action: {
                                    showProduct(spotlightItem.asProduct())
                                }, label: {
                                    NetworkImage(imageURL: spotlightItem.bannerURL,width: 340, height: 160)
                                })
                                
                            }
                        }
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("digio ").font(alexandria18).fontWeight(.bold).foregroundColor(.accentColor) + Text("Cash").font(alexandria18).fontWeight(.bold).foregroundColor(.secondary)
                        
                        GeometryReader{geometry in
                            
                            Button(action: {
                                showProduct($viewModel.productList.cash.wrappedValue.asProduct())
                            }, label: {
                                NetworkImage(imageURL: $viewModel.productList.cash.bannerURL.wrappedValue, width: geometry.size.width, height: 110, cornerRadius: 12, contentMode: .fill)
                            }).cornerRadius(12)
                        }
                        
                    }.padding()
                    
                    
                    VStack(alignment: .leading){
                        Text("Produtos").font(alexandria18).fontWeight(.bold).foregroundColor(.accentColor)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach($viewModel.productList.products, id: \.self) { productItem in
                                    
                                    Button(action: {
                                        showProduct(productItem.wrappedValue)
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 18).fill(Color.white).frame(width: 120, height: 120).shadow(color: .black.opacity(0.2), radius: 4, x: 3, y: 3).padding(4)
                                            
                                            NetworkImage(imageURL: productItem.imageURL.wrappedValue, width: 50, displayPlaceholderBackground: false)
                                        }
                                    })
                                }
                            }
                        }
                        
                    }.padding()
                    
                    Spacer()
                    
                    
                }.toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        HStack{
                            Text("Olá, Maria").font(.system(size: 18).weight(.semibold))
                            Spacer()
                        }
                    })
                })
            }
            
            ProductDetailsView(product: $product.wrappedValue, isShown: $toggleProductDetail)
            
        }.onAppear(perform: {
            self.viewModel.getProductList()
        })
    }
    
    
    func showProduct(_ product: Product){
        $product.wrappedValue = product
        $toggleProductDetail.wrappedValue.toggle()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            HomeView()
        })
    }
}
