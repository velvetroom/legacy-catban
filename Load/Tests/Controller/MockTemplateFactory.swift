import Foundation
import Board
import Shared

class MockTemplateFactory:TemplateFactoryProtocol {
    static var templateCalled:Bool!
    
    static func newProject() -> ProjectProtocol {
        MockTemplateFactory.templateCalled = true
        return ProjectFactory.newProject()
    }
}
