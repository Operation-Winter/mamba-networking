//
//  PlanningCommands.SpectatorServerSend+Extensions.swift
//  
//
//  Created by Armand Kamffer on 2022/04/17.
//

import Foundation

public extension PlanningCommands.SpectatorServerSend {
    private enum CodingKeys: String, CodingKey {
        case uuid
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        (decoder as? JSONDecoder)?.dateDecodingStrategy = .iso8601
        
        guard let commandType = PlanningCommands.SpectatorServerSendKey(rawValue: type) else {
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
        case .sessionIdleTimeout:
            self = .sessionIdleTimeout
        case .invalidSession:
            self = .invalidSession
        case .endSession:
            self = .endSession
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
        case .sessionIdleTimeout: break
        case .invalidSession: break
        case .endSession: break
        case .coffeeVoting(let message): try container.encode(message, forKey: .message)
        case .coffeeVotingFinished(let message): try container.encode(message, forKey: .message)
        }
    }
    
    var rawValue: String {
        switch self {
        case .noneState:
            return PlanningCommands.SpectatorServerSendKey.noneState.rawValue
        case .votingState:
            return PlanningCommands.SpectatorServerSendKey.votingState.rawValue
        case .finishedState:
            return PlanningCommands.SpectatorServerSendKey.finishedState.rawValue
        case .invalidCommand:
            return PlanningCommands.SpectatorServerSendKey.invalidCommand.rawValue
        case .sessionIdleTimeout:
            return PlanningCommands.SpectatorServerSendKey.sessionIdleTimeout.rawValue
        case .invalidSession:
            return PlanningCommands.SpectatorServerSendKey.invalidSession.rawValue
        case .endSession:
            return PlanningCommands.SpectatorServerSendKey.endSession.rawValue
        case .coffeeVoting:
            return PlanningCommands.SpectatorServerSendKey.coffeeVoting.rawValue
        case .coffeeVotingFinished:
            return PlanningCommands.SpectatorServerSendKey.coffeeVotingFinished.rawValue
        }
    }
}
