import Foundation

public class PlanningSpectator {
    public private(set) var spectatorId: UUID
    
    public init(spectatorId: UUID) {
        self.spectatorId = spectatorId
    }
}
