//
//  PlanningCommands_HostServerSendTests_Decoding.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommands_HostServerSendTests_Decoding: XCTestCase {
    private var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func testInvalidParsingCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.invalidEncodedCommand
        
        // When: JSON is mapped to a command
        guard let data = mockedJson.data(using: .utf8) else {
            XCTFail("Error thrown")
            return
        }
        
        XCTAssertThrowsError(try decoder.decode(PlanningCommands.HostServerSend.self, from: data))
    }
    
    func testNoneStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = Mocks.noneState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.HostServerSend.self, from: data)
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
            XCTAssertEqual(message.updated, Expected.stateMessage.updated)
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
            let command = try? decoder.decode(PlanningCommands.HostServerSend.self, from: data)
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
            XCTAssertEqual(message.updated, Expected.stateMessage.updated)
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
            let command = try? decoder.decode(PlanningCommands.HostServerSend.self, from: data)
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
            XCTAssertEqual(message.updated, Expected.stateMessage.updated)
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
            let command = try? decoder.decode(PlanningCommands.HostServerSend.self, from: data)
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
            "coffeeVotes": [],
            "updated": "2020-05-31T04:32:27Z"
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
            "coffeeVotes": [],
            "updated": "2020-05-31T04:32:27Z"
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
            "coffeeVotes": [],
            "updated": "2020-05-31T04:32:27Z"
        },
        "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"
    }
    """
    
    static let invalidCommand = """
    { "type": "INVALID_COMMAND", "message": { "code": "0", "description": "Test" } }
    """
}

fileprivate class Expected {
    static let stateMessage: PlanningSessionStateMessage = {
        let planningTicket = PlanningTicket(title: "x", description: "Test", selectedTags: ["Test"], ticketVotes: [PlanningTicketVote(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), selectedCard: .question, tag: "Tag")])
        
        return PlanningSessionStateMessage(sessionCode: "000000",
                                           sessionName: "Test",
                                           password: "Password",
                                           availableCards: [.question],
                                           participants: [
                                            PlanningParticipant(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), name: "Test",
                                                                connected: false)
                                           ], ticket: planningTicket,
                                           timeLeft: 2,
                                           spectatorCount: 1,
                                           coffeeRequestCount: 2,
                                           coffeeVotes: nil,
                                           updated: ISO8601DateFormatter().date(from: "2020-05-31T04:32:27Z")!)
    }()
    
    static let invalidCommandMessage = PlanningInvalidCommandMessage(code: "0", description: "Test")
}
