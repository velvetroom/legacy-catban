import Foundation

protocol StatsProtocol:ModelProtocol {
    var board:BoardProtocol { get set }
    var presenter:StatsPresenterProtocol { get set }
    var items:[StatsItemProtocol] { get set }
    
    func reloadViewModel()
}
