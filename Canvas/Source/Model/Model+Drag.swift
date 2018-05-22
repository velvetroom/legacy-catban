import Foundation

extension Model {
    func dragBegin() {
        self.restartPosition()
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
    
    private func restartPosition() {
        self.position.initialItem = self.viewItem.position
        self.position.initialTouch = self.latestTouch
        self.position.latestTouch = self.latestTouch
    }
}
