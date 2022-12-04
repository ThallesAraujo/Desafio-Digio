//
//  APIUrls.swift
//  Desafio-Digio
//
//  Created by Thalles Araújo on 03/12/22.
//

import Foundation

enum APIUrls{
    
    static let baseUrlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
    
    case getProducts
    
    func request() throws -> URLRequest{
        switch self {
        case .getProducts:
            return URLRequest(url: URL.init(string: APIUrls.baseUrlString)!)
        }
    }
    
}
