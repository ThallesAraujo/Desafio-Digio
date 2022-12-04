//
//  Test+JsonExtension.swift
//  Desafio-DigioTests
//
//  Created by Thalles Araújo on 04/12/22.
//

import XCTest
extension XCTest {
    
    func loadJson(filename fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}
