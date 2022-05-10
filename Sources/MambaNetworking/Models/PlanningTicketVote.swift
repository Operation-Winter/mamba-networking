//
//  PlanningTicketVote.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public class PlanningTicketVote: Codable {
    public private(set) var participantId: UUID
    public private(set) var selectedCard: PlanningCard?
    public private(set) var tag: String?
    
    public var skipped: Bool {
        selectedCard == nil
    }
    
    public init(participantId: UUID, selectedCard: PlanningCard?, tag: String?) {
        self.participantId = participantId
        self.selectedCard = selectedCard
        self.tag = tag
    }
}
