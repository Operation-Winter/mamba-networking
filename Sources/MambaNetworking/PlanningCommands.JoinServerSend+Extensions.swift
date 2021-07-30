//
//  PlanningCommand.JoinServerSend+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/31.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.JoinServerSend {
    private enum CodingKeys: String, CodingKey {
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        guard let commandType = PlanningCommands.JoinServerSendKey(rawValue: type) else {
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
        case .invalidSession:
            self = .invalidSession
        case .removeParticipant:
            self = .removeParticipant
        case .endSession:
            self = .endSession
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
        case .invalidSession: break
        case .removeParticipant: break
        case .endSession: break
        }
    }
    
    var rawValue: String {
        switch self {
        case .noneState:
            return PlanningCommands.JoinServerSendKey.noneState.rawValue
        case .votingState:
            return PlanningCommands.JoinServerSendKey.votingState.rawValue
        case .finishedState:
            return PlanningCommands.JoinServerSendKey.finishedState.rawValue
        case .invalidCommand:
            return PlanningCommands.JoinServerSendKey.invalidCommand.rawValue
        case .invalidSession:
            return PlanningCommands.JoinServerSendKey.invalidSession.rawValue
        case .removeParticipant:
            return PlanningCommands.JoinServerSendKey.removeParticipant.rawValue
        case .endSession:
            return PlanningCommands.JoinServerSendKey.endSession.rawValue
        }
    }
}
