import Foundation

extension Model {
    func dragBegin() {
        self.mapItem = self.viewItem.mapItem
        self.position.restartWith(item:self.mapItem, and:self.latestTouch)
        self.change(stateType:self.viewItem.dragState)
        self.viewItem.stateHighlighted()
    }
    
    func dragUpdate() {
        self.position.latestTouch = self.latestTouch
        self.state.update()
    }
    
    func dragEnd() {
        self.state.end()
    }
    
    func change(stateType:DragStateProtocol.Type) {
        self.state = stateType.init()
        self.state.event = self
        self.state.changer = self
        self.state.mapEditor = self
    }
}
