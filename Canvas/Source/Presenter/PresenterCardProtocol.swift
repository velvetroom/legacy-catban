import Foundation
import Board

protocol PresenterCardProtocol:PresenterItemProtocol {
    var card:CardProtocol! { get set }
}
