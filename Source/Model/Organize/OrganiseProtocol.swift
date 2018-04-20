import Foundation

protocol OrganiseProtocol:ModelProtocol {
    var board:BoardProtocol { get set }
    var presenter:OrganisePresenterProtocol { get set }
}
