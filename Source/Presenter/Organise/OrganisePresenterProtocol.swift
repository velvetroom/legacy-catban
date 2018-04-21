import Foundation

protocol OrganisePresenterProtocol {
    var factory:OrganisePresenterFactoryProtocol { get set }
    var outlets:OrganisePresenterOutlets { get set }
    var collection:OrganisePresenterCollection { get set }
    
    func updateWith(board:BoardProtocol)
}
