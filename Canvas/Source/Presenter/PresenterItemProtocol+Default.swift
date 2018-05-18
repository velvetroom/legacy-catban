import Foundation

extension PresenterItemProtocol {
    func load() {
        self.assignReferences()
        self.configureView()
        self.mapColumn.append(item:self.mapItem)
    }
    
    private func assignReferences() {
        self.mapItem.view = self.viewItem
        self.viewItem.mapItem = self.mapItem
    }
    
    private func configureView() {
        self.view.addSubview(self.viewItem)
        self.configureConstraints()
        self.activateConstraints()
        self.configureContent()
    }
    
    private func configureConstraints() {
        self.viewItem.layoutTop = self.viewItem.topAnchor.constraint(equalTo:self.view.topAnchor)
        self.viewItem.layoutLeft = self.viewItem.leftAnchor.constraint(equalTo:self.viewItem.leftAnchor)
        self.viewItem.layoutHeight = self.viewItem.heightAnchor.constraint(equalToConstant:self.height)
        self.viewItem.layoutWidth = self.viewItem.widthAnchor.constraint(equalToConstant:Constants.Column.width)
    }
    
    private func activateConstraints() {
        self.viewItem.layoutTop.isActive = true
        self.viewItem.layoutLeft.isActive = true
        self.viewItem.layoutHeight.isActive = true
        self.viewItem.layoutWidth.isActive = true
    }
}
