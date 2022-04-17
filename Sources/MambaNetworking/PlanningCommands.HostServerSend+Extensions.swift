//
//  PlanningCommands.HostServerSend+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.HostServerSend {
    private enum CodingKeys: String, CodingKey {
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        guard let commandType = PlanningCommands.HostServerSendKey(rawValue: type) else {
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
        }
        switch commandType {
        case .noneState:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .noneState(message: model)
        case .votingState:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .votingState(message: model)
        case .finishedState:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .finishedState(message: model)
        case .invalidCommand:
            let model = try container.decode(PlanningInvalidCommandMessage.self, forKey: .message)
            self = .invalidCommand(message: model)
        case .previousTickets:
            let model = try container.decode(PlanningPreviousTicketsMessage.self, forKey: .message)
            self = .previousTickets(message: model)
        case .sessionIdleTimeout:
            self = .sessionIdleTimeout
        case .coffeeVoting:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .coffeeVoting(message: model)
        case .coffeeVotingFinished:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .coffeeVotingFinished(message: model)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .type)
        
        switch self {
        case .noneState(let message): try container.encode(message, forKey: .message)
        case .votingState(let message): try container.encode(message, forKey: .message)
        case .finishedState(let message): try container.encode(message, forKey: .message)
        case .invalidCommand(let message): try container.encode(message, forKey: .message)
        case .previousTickets(let message): try container.encode(message, forKey: .message)
        case .sessionIdleTimeout: break
        case .coffeeVoting(let message): try container.encode(message, forKey: .message)
        case .coffeeVotingFinished(let message): try container.encode(message, forKey: .message)
        }
    }
    
    var rawValue: String {
        switch self {
        case .noneState:
            return PlanningCommands.HostServerSendKey.noneState.rawValue
        case .votingState:
            return PlanningCommands.HostServerSendKey.votingState.rawValue
        case .finishedState:
            return PlanningCommands.HostServerSendKey.finishedState.rawValue
        case .invalidCommand:
            return PlanningCommands.HostServerSendKey.invalidCommand.rawValue
        case .previousTickets:
            return PlanningCommands.HostServerSendKey.previousTickets.rawValue
        case .sessionIdleTimeout:
            return PlanningCommands.HostServerSendKey.sessionIdleTimeout.rawValue
        case .coffeeVoting:
            return PlanningCommands.HostServerSendKey.coffeeVoting.rawValue
        case .coffeeVotingFinished:
            return PlanningCommands.HostServerSendKey.coffeeVotingFinished.rawValue
        }
    }
}
