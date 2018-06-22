import Foundation

extension IdentifierProtocol {
    func equals(model:IdentifierProtocol) -> Bool {
        guard
            self.identifier.isEmpty == false,
            model.identifier.isEmpty == false
        else { return false }
        return self.identifier == model.identifier
    }
}
