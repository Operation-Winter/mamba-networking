//
//  Array+Extensions.swift
//  
//
//  Created by Armand Kamffer on 2020/10/04.
//

import Foundation

extension Array {
    func element(at index: Int) -> Element? {
        indices.contains(index)
            ? self[index]
            : nil
    }
}
