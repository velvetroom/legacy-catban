import Foundation

protocol StatsProtocol:ModelProtocol {
    var board:BoardProtocol { get set }
    var presenter:StatsPresenterProtocol { get set }
}
