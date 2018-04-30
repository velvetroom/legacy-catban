import Foundation

protocol StatsPresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol, for items:[StatsItemProtocol]) -> StatsViewModel
}
