//
//  ProductStub.swift
//  Desafio-DigioTests
//
//  Created by Thalles Araújo on 04/12/22.
//

import Foundation
@testable import Desafio_Digio
import OHHTTPStubs

let stubsDefaultHeaders = [ "Content-Type": "application/json" ]

class ProductStub {
    
    static func successResponseStub() {
        
        stub(condition: isMethodGET(), response: { _ in
            
            let stubPath = OHPathForFile("MockResponseOne.json", ProductStub.self)
            
            return HTTPStubsResponse(
                fileAtPath: stubPath!,
                statusCode: 200,
                headers: stubsDefaultHeaders)
            
        })
        
    }
    
}
