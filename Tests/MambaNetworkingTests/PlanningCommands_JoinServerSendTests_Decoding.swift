//
//  PlanningCommands_JoinServerSendTests_Decoding.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest 
@testable import MambaNetworking

class PlanningCommands_JoinServerSendTests_Decoding: XCTestCase {
    
    func testNoneStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.noneState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .noneState(let message) = command {
            XCTAssertEqual(message.sessionCode, Expected.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, Expected.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, Expected.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, Expected.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, Expected.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, Expected.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, Expected.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, Expected.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, Expected.stateMessage.ticket?.ticketVotes.first?.participantId)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testVotingStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.votingState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .votingState(let message) = command {
            XCTAssertEqual(message.sessionCode, Expected.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, Expected.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, Expected.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, Expected.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, Expected.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, Expected.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, Expected.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, Expected.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, Expected.stateMessage.ticket?.ticketVotes.first?.participantId)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testFinishedVotingStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.finishedVotingState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .finishedState(let message) = command {
            XCTAssertEqual(message.sessionCode, Expected.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, Expected.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, Expected.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, Expected.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, Expected.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, Expected.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, Expected.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, Expected.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, Expected.stateMessage.ticket?.ticketVotes.first?.participantId)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testInvalidCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.invalidCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .invalidCommand(let message) = command {
            XCTAssertEqual(message.code, Expected.invalidCommandMessage.code)
            XCTAssertEqual(message.description, Expected.invalidCommandMessage.description)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testInvalidSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.invalidSessionCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .invalidSession = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testRemoveParticipantCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.removeParticipantCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .removeParticipant = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testEndSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.endSessionCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? JSONDecoder().decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .endSession = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
}

fileprivate class Mocks {
    static let noneState = """
    {
        "type": "NONE_STATE",
        "message": {
            "sessionCode": "000000",
            "sessionName": "Test",
            "availableCards": ["QUESTION"],
            "participants": [
                {"participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "name": "Test", "connected": false }
            ],
            "ticket": {
                "title": "x",
                "description":"Test",
                "selectedTags":["Test"],
                "ticketVotes": [{"participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "selectedCard": "QUESTION"}]
            },
            "tags": ["iOS"],
            "password": "password",
            "spectatorCount": 1,
            "coffeeRequestCount": 2,
            "coffeeVotes": []
        },
        "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"
    }
    """
    
    static let votingState = """
    {
        "type": "VOTING_STATE",
        "message": {
            "sessionCode": "000000", "sessionName": "Test", "availableCards": ["QUESTION"],
            "participants": [{ "participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "name": "Test", "connected": false }],
            "ticket": {
                "title": "x", "description":"Test", "selectedTags":["Test"], "ticketVotes": [{"participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "selectedCard": "QUESTION"}]
            },
            "tags": ["iOS"],
            "password": "password",
            "spectatorCount": 1,
            "coffeeRequestCount": 2,
            "coffeeVotes": []
        },
        "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"
    }
    """
    
    static let finishedVotingState = """
    {
        "type": "FINISHED_STATE",
        "message": {
            "sessionCode": "000000", "sessionName": "Test", "availableCards": ["QUESTION"],
            "participants": [{ "participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "name": "Test", "connected": false }],
            "ticket": {
                "title": "x", "description":"Test", "selectedTags":["Test"], "ticketVotes": [{"participantId": "754909ED-1648-4B51-AB55-4CA6C8910231", "selectedCard": "QUESTION"}]
            },
            "tags": ["iOS"],
            "password": "password",
            "spectatorCount": 1,
            "coffeeRequestCount": 2,
            "coffeeVotes": []
        },
        "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"
    }
    """
    
    static let invalidCommand = """
    {
        "type": "INVALID_COMMAND",
        "message": { "code": "0", "description": "Test" },
        "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"
    }
    """
    
    static let invalidSessionCommand = """
    { "type": "INVALID_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231" }
    """
    
    static let removeParticipantCommand = """
    { "type": "REMOVE_PARTICIPANT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231" }
    """
    
    static let endSessionCommand = """
    { "type": "END_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231" }
    """
}

fileprivate class Expected {
    static let stateMessage: PlanningSessionStateMessage = {
        let planningTicket = PlanningTicket(title: "x", description: "Test", selectedTags: ["Test"], ticketVotes: [PlanningTicketVote(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), selectedCard: .question, tag: "Tag")])
        
        return PlanningSessionStateMessage(sessionCode: "000000", sessionName: "Test", availableCards: [.question], participants: [PlanningParticipant(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), name: "Test", connected: false)], ticket: planningTicket, timeLeft: 2, tags: ["iOS"], spectatorCount: 1, coffeeRequestCount: 2, coffeeVotes: [])
    }()
    
    static let invalidCommandMessage = PlanningInvalidCommandMessage(code: "0", description: "Test")
}
