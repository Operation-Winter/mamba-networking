import Foundation
@testable import MambaNetworking

class TestDataGenerator {
    static let uuid = UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231")!
    
    static let invalidEncodedCommand = """
        {"type":"???", "uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    class States {
        static let stateMessage: PlanningSessionStateMessage = {
            let planningTicket = PlanningTicket(title: "x",
                                                description: "Test",
                                                selectedTags: ["Test"],
                                                ticketVotes: [
                                                    PlanningTicketVote(participantId: uuid, selectedCard: .question, tag: "Tag")
                                                ])
            
            return PlanningSessionStateMessage(sessionCode: "000000",
                                               sessionName: "Test",
                                               password: "Password",
                                               availableCards: [.question],
                                               participants: [
                                                PlanningParticipant(participantId: uuid, name: "Test", connected: false)
                                               ],
                                               ticket: planningTicket,
                                               timeLeft: 2,
                                               spectatorCount: 1,
                                               coffeeRequestCount: 2,
                                               coffeeVotes: [],
                                               updated: ISO8601DateFormatter().date(from: "2020-05-31T04:32:27Z")!)
        }()
    }
    
    class StatesEncoded {
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
        
        static let coffeeVotingState = """
            {
                "type": "COFFEE_VOTING",
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
        
        static let coffeeVotingFinishedState = """
            {
                "type": "COFFEE_VOTING_FINISHED",
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
    }
    
    class JoinServerReceive {
        static let joinSession: PlanningCommands.JoinServerReceive = .joinSession(uuid: uuid,
                                                                                  message: joinSessionMessage)
        
        static let joinSessionMessage = PlanningJoinSessionMessage(sessionCode: "000000",
                                                                   participantName: "Test",
                                                                   password: "password")
        
        static let vote: PlanningCommands.JoinServerReceive = .vote(uuid: uuid,
                                                                    message: voteMessage)
        
        static let voteMessage = PlanningVoteMessage(selectedCard: .question,
                                                     tag: "Tag")
        
        static let leaveSession: PlanningCommands.JoinServerReceive = .leaveSession(uuid: uuid)
        static let reconnect: PlanningCommands.JoinServerReceive = .reconnect(uuid: uuid)
        
        static let changeName: PlanningCommands.JoinServerReceive = .changeName(uuid: uuid,
                                                                                message: changeNameMessage)
        
        static let changeNameMessage = PlanningChangeNameMessage(name: "TestName")
        
        static let requestCoffeeBreak: PlanningCommands.JoinServerReceive = .requestCoffeeBreak(uuid: uuid)
        
        static let coffeeBreakVote: PlanningCommands.JoinServerReceive = .coffeeBreakVote(uuid: uuid,
                                                                                          message: coffeeBreakVoteMessage)
        
        static let coffeeBreakVoteMessage = PlanningCoffeeBreakVoteMessage(vote: true)
        
        static let concedeVote: PlanningCommands.JoinServerReceive = .concedeVote(uuid: uuid,
                                                                                  message: voteMessage)
    }

    class JoinServerReceiveEncoded {
        static let joinSession = """
            {"type":"JOIN_SESSION","message":{"participantName":"Test","password":"password","sessionCode":"000000"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let vote = """
            {"type":"VOTE","message":{"tag":"Tag","selectedCard":"QUESTION"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let leaveSession = """
            {"type":"LEAVE_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let reconnect = """
            {"type":"RECONNECT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let changeName = """
            {"type":"CHANGE_NAME","message":{"name":"TestName"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let requestCoffeeBreak = """
            {"type":"REQUEST_COFFEE_BREAK","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let coffeeBreakVote = """
            {"type":"COFFEE_BREAK_VOTE","message":{"vote":true},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
        
        static let concedeVote = """
            {"type":"CONCEDE_VOTE","message":{"tag":"Tag","selectedCard":"QUESTION"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
            """
    }

    
    class JoinServerSend {
        static let invalidCommandMessage = PlanningInvalidCommandMessage(code: "0",
                                                                         description: "Test")
    }
    
    class JoinServerSendEncoded {
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
        
        static let sessionIdleTimeout = """
            { "type": "SESSION_IDLE_TIMEOUT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231" }
            """
    }
}
