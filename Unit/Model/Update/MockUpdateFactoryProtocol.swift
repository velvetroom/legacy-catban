import Foundation
@testable import catban

class MockUpdateFactoryProtocol:UpdateFactoryProtocol {
    var onCreateCard:((IndexPath) -> Void)?
    var onCreateProject:(() -> Void)?
    var onDeleteCardAtIndex:((IndexPath) -> Void)?
    var onDeleteColumnAtIndex:((Int, ProjectProtocol) -> Void)?
    var onMovingItemsFromColumn:((Int, ProjectProtocol) -> Void)?
    var onCreateColumnIn:((ProjectProtocol) -> Void)?
    var onDeleteProject:((BoardProtocol) -> Void)?
    var onMoveCardFrom:((IndexPath, IndexPath) -> Void)?
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        self.onDeleteColumnAtIndex?(index, project)
        return []
    }
    
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        self.onMovingItemsFromColumn?(index, project)
        return []
    }
    
    func createCard(indexPath:IndexPath) -> [UpdateProtocol] {
        self.onCreateCard?(indexPath)
        return []
    }
    
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol] {
        self.onCreateColumnIn?(project)
        return []
    }
    
    func createProject() -> [UpdateProtocol] {
        self.onCreateProject?()
        return []
    }
    
    func deleteCardAt(index:IndexPath) -> [UpdateProtocol] {
        self.onDeleteCardAtIndex?(index)
        return []
    }
    
    func deleteProject(board:BoardProtocol) throws -> [UpdateProtocol] {
        self.onDeleteProject?(board)
        return []
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) -> [UpdateProtocol] {
        self.onMoveCardFrom?(origin, destination)
        return []
    }
}
