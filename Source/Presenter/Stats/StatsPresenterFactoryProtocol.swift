import Foundation

protocol StatsPresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol) -> StatsViewModel
}
