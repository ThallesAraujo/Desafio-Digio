//
//  Desafio_DigioTests.swift
//  Desafio-DigioTests
//
//  Created by Thalles Araújo on 04/12/22.
//

import XCTest
@testable import Desafio_Digio

final class Desafio_DigioTests: XCTestCase {
    
    var sut: Desafio_Digio.ProductListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ProductListViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testResponseSpotlight() throws {
        
        requestProductList {
            XCTAssertEqual(self.sut.productList.spotlight[0].spotlightDescription, "Amarelo")
        }
    }
    
    func testResponseProduto() throws {
        
        requestProductList {
            XCTAssertEqual(self.sut.productList.products[1].productDescription, "Júpiter")
        }
        
    }
    
    func testResponseCash() throws {
        
        requestProductList {
            XCTAssertEqual(self.sut.productList.cash.cashDescription, "Espanha")
        }
        
    }
    
    func requestProductList(andAssert assertion: @escaping () -> Void) {
        ProductStub.successResponseStub()
        
        let promise = expectation(description: "Valor recebido")
        
        sut.completion = {
            assertion()
            promise.fulfill()
        }
        
        sut.getProductList()
        
        wait(for: [promise], timeout: 5)
    }
    
}
