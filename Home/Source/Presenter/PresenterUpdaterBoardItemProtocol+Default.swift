import Foundation

extension PresenterUpdaterBoardItemProtocol {
    func update() {
        self.configureView()
        self.column.add(item:self.dragItem)
    }
    
    private func configureView() {
        self.viewBoard.addSubview(self.viewItem)
        self.configureConstraints()
        self.configureContent()
    }
    
    private func configureConstraints() {
        self.viewItem.layoutTop = self.viewItem.topAnchor.constraint(equalTo:self.viewBoard.topAnchor)
        self.viewItem.layoutLeft = self.viewItem.leftAnchor.constraint(equalTo:self.viewBoard.leftAnchor)
        self.viewItem.heightAnchor.constraint(equalToConstant:self.viewModel.height).isActive = true
        self.viewItem.widthAnchor.constraint(equalToConstant:ViewConstants.Column.itemWidth).isActive = true
        self.viewItem.layoutTop.isActive = true
        self.viewItem.layoutLeft.isActive = true
    }
}
