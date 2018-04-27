import Foundation

protocol HistoryProtocol {
    var items:[HistoryItemProtocol] { get set }
    
    func created(card:ProjectCard)
}
