import Foundation

extension MapItemProtocol {
    func detach() {
        self.parent.detachChild()
    }
}
