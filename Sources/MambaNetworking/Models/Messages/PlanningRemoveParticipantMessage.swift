//
//  PlanningRemoveParticipantMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningRemoveParticipantMessage: Codable {
    public let participantId: UUID
    
    public init(participantId: UUID) {
        self.participantId = participantId
    }
}
