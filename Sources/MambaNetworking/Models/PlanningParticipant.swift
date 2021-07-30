//
//  PlanningParticipant.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public class PlanningParticipant: Codable, Identifiable {
    public private(set) var participantId: UUID
    public var name: String
    public var connected: Bool
    
    public init(participantId: UUID, name: String, connected: Bool) {
        self.participantId = participantId
        self.name = name
        self.connected = connected
    }
}
