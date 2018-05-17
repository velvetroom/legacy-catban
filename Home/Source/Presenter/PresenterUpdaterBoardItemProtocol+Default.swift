import Foundation

extension PresenterUpdaterBoardItemProtocol {
    func update() {
        self.configureView()
        self.column.append(item:self.dragItem)
    }
    
    private func configureView() {
        self.viewBoard.addSubview(self.viewItem)
        self.configureConstraints()
        self.configureContent()
    }
    
    private func configureConstraints() {
        self.viewItem.layoutTop = self.viewItem.topAnchor.constraint(equalTo:self.viewBoard.topAnchor)
        self.viewItem.layoutLeft = self.viewItem.leftAnchor.constraint(equalTo:self.viewBoard.leftAnchor)
        self.viewItem.layoutHeight = self.viewItem.heightAnchor.constraint(equalToConstant:self.viewModel.height)
        self.viewItem.layoutWidth = self.viewItem.widthAnchor.constraint(
            equalToConstant:ViewConstants.Column.width)
        self.viewItem.layoutTop.isActive = true
        self.viewItem.layoutLeft.isActive = true
        self.viewItem.layoutHeight.isActive = true
        self.viewItem.layoutWidth.isActive = true
    }
}
