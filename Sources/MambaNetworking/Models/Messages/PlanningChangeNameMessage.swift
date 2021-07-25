//
//  PlanningChangeNameMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2021/07/25
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningChangeNameMessage: Codable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
