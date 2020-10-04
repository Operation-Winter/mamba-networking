//
//  PlanningSessionStateMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/30.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningSessionStateMessage: Codable {
    public let sessionCode: String
    public let sessionName: String
    public let availableCards: [PlanningCard]
    public let participants: [PlanningParticipant]
    public let ticket: PlanningTicket?
    
    public init(sessionCode: String, sessionName: String, availableCards: [PlanningCard], participants: [PlanningParticipant], ticket: PlanningTicket?) {
        self.sessionCode = sessionCode
        self.sessionName = sessionName
        self.availableCards = availableCards
        self.participants = participants
        self.ticket = ticket
    }
}
