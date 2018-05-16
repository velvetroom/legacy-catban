import Foundation

class PresenterUpdaterCard:PresenterUpdaterBoardItemProtocol {
    var controller:Controller!
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var drag:Drag!
    private let view:ViewCard
    
    required init() {
        self.view = ViewCard()
    }
    
    func factoryView() {
        self.addCard()
        self.addLayout()
        self.configureView()
        self.activateLayout()
    }
    
    private func addCard() {
        self.viewBoard.addSubview(self.view)
        self.viewBoard.items.append(self.view)
    }
    
    private func addLayout() {
        let viewModel:ViewModelCard = self.viewModel as! ViewModelCard
        self.view.layoutWidth = self.view.widthAnchor.constraint(equalToConstant:viewModel.width)
        self.view.layoutHeight = self.view.heightAnchor.constraint(equalToConstant:viewModel.height)
        self.view.layoutTop = self.view.topAnchor.constraint(
            equalTo:self.viewBoard.topAnchor, constant:viewModel.top)
        self.view.layoutLeft = self.view.leftAnchor.constraint(
            equalTo:self.viewBoard.leftAnchor, constant:viewModel.left)
    }
    
    private func configureView() {
        let viewModel:ViewModelCard = self.viewModel as! ViewModelCard
        self.view.identifier = viewModel.identifier
        self.view.labelContent.text = viewModel.content
    }
    
    private func activateLayout() {
        self.view.layoutWidth.isActive = true
        self.view.layoutHeight.isActive = true
        self.view.layoutTop.isActive = true
        self.view.layoutLeft.isActive = true
    }
}
