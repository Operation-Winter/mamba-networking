//
//  PlanningJoinSessionMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/31.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningJoinSessionMessage: Codable {
    public let sessionCode: String
    public let participantName: String
    public let password: String?
    
    public init(sessionCode: String, participantName: String, password: String?) {
        self.sessionCode = sessionCode
        self.participantName = participantName
        self.password = password
    }
}
