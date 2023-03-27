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
    public let password: String?
    public let availableCards: [PlanningCard]
    public let participants: [PlanningParticipant]
    public let ticket: PlanningTicket?
    public let timeLeft: Int?
    public let spectatorCount: Int
    public let coffeeRequestCount: Int
    public let coffeeVotes: [PlanningCoffeeVote]?
    public let updated: Date
    
    public init(sessionCode: String,
                sessionName: String,
                password: String?,
                availableCards: [PlanningCard],
                participants: [PlanningParticipant],
                ticket: PlanningTicket?,
                timeLeft: Int?,
                spectatorCount: Int,
                coffeeRequestCount: Int,
                coffeeVotes: [PlanningCoffeeVote]?,
                updated: Date) {
        self.sessionCode = sessionCode
        self.sessionName = sessionName
        self.password = password
        self.availableCards = availableCards
        self.participants = participants
        self.ticket = ticket
        self.timeLeft = timeLeft
        self.spectatorCount = spectatorCount
        self.coffeeRequestCount = coffeeRequestCount
        self.coffeeVotes = coffeeVotes
        self.updated = updated
    }
}
