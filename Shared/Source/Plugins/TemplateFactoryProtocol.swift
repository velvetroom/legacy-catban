import Foundation
import Board

public protocol TemplateFactoryProtocol {
    static func newProject() -> ProjectProtocol
}
