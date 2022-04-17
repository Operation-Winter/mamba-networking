//
//  PlanningSpectateSessionMessage.swift
//  
//
//  Created by Armand Kamffer on 2022/04/17.
//

import Foundation

public struct PlanningSpectateSessionMessage: Codable {
    public let sessionCode: String
    public let password: String?
    
    public init(sessionCode: String, password: String?) {
        self.sessionCode = sessionCode
        self.password = password
    }
}
