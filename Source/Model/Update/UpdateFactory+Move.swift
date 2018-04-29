import Foundation

extension UpdateFactory {
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) -> [UpdateProtocol] {
        let update:UpdateMoveCard = UpdateMoveCard()
        update.origin = origin
        update.destination = destination
        return [update]
    }
}
