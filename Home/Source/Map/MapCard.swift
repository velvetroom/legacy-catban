import Foundation

class MapCard:MapItemProtocol, MapParentProtocol {
    weak var parent:MapParentProtocol!
    var position:MapPositionProtocol
    var childItem:MapItemProtocol?
    
    init() {
        self.position = MapPositionStatic()
    }
    
    func becomeInteractive() {
        self.change(position:MapPositionInteractive())
    }
    
    func becomeStatic() {
        self.change(position:MapPositionStatic())
    }
    
    private func change(position:MapPositionProtocol) {
        position.view = self.view
        self.position = position
    }
}
