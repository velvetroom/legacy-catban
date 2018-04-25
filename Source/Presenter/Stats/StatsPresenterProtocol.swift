import Foundation

protocol StatsPresenterProtocol {
    var outlets:StatsPresenterOutlets { get set }
    var collection:StatsPresenterCollection { get set }
    var factory:StatsPresenterFactoryProtocol { get set }
    
    func updateWith(board:BoardProtocol, for items:[StatsItemProtocol])
}
