//
//  PlanningTicket.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/07.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public class PlanningTicket: Codable {
    public var title: String
    public var description: String
    public var selectedTags: Set<String>
    public private(set) var ticketVotes: [PlanningTicketVote]
    
    public init(title: String,
                description: String,
                selectedTags: Set<String>,
                ticketVotes: [PlanningTicketVote] = []) {
        self.title = title
        self.description = description
        self.selectedTags = selectedTags
        self.ticketVotes = ticketVotes
    }
    
    public func removeVotes(participantId: UUID) {
        ticketVotes.removeAll { $0.participantId == participantId }
    }
    
    public func removeVotesAll() {
        ticketVotes.removeAll()
    }
    
    public func add(vote: PlanningTicketVote) {
        ticketVotes.append(vote)
    }
}
