import XCTest
@testable import MambaNetworking

class PlanningCommands_JoinServerReceiveTests_Decoding: XCTestCase {
    private var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func testInvalidCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.invalidEncodedCommand
        
        // When: JSON is mapped to a command
        guard let data = mockedJson.data(using: .utf8) else {
            XCTFail("Error thrown")
            return
        }
        
        XCTAssertThrowsError(try decoder.decode(PlanningCommands.JoinServerReceive.self, from: data))
    }
    
    func testJoinSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.joinSession
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .joinSession(let uuid, let message) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
            XCTAssertEqual(message.participantName, TestDataGenerator.JoinServerReceive.joinSessionMessage.participantName)
            XCTAssertEqual(message.password, TestDataGenerator.JoinServerReceive.joinSessionMessage.password)
            XCTAssertEqual(message.sessionCode, TestDataGenerator.JoinServerReceive.joinSessionMessage.sessionCode)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testVoteCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.vote
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .vote(let uuid, let message) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
            XCTAssertEqual(message.selectedCard, TestDataGenerator.JoinServerReceive.voteMessage.selectedCard)
            XCTAssertEqual(message.tag, TestDataGenerator.JoinServerReceive.voteMessage.tag)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testLeaveSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.leaveSession
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .leaveSession(let uuid) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testReconnectCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.reconnect
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .reconnect(let uuid) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testChangeNameCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.changeName
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .changeName(let uuid, let message) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
            XCTAssertEqual(message.name, TestDataGenerator.JoinServerReceive.changeNameMessage.name)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testRequestCoffeeBreakCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.requestCoffeeBreak
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .requestCoffeeBreak(let uuid) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testCoffeeBreakVoteCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.coffeeBreakVote
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .coffeeBreakVote(let uuid, let message) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
            XCTAssertEqual(message.vote, TestDataGenerator.JoinServerReceive.coffeeBreakVoteMessage.vote)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testConcedeVoteCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerReceiveEncoded.concedeVote
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerReceive.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .concedeVote(let uuid, let message) = command {
            XCTAssertEqual(uuid, TestDataGenerator.uuid)
            XCTAssertEqual(message.selectedCard, TestDataGenerator.JoinServerReceive.voteMessage.selectedCard)
            XCTAssertEqual(message.tag, TestDataGenerator.JoinServerReceive.voteMessage.tag)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
}
