import Foundation
import Board

public class KanbanFactory {
    public class func newProject() -> ProjectProtocol {
        return ProjectFactory.newProject()
    }
}
