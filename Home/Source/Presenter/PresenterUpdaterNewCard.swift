import Foundation

class PresenterUpdaterNewCard:PresenterUpdaterBoardItemProtocol {
    var controller:Controller!
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    private let view:ViewNewCard
    
    required init() {
        self.view = ViewNewCard()
    }
    
    func factoryView() {
        self.addNewCard()
        self.addLayout()
        self.activateLayout()
    }
    
    private func addNewCard() {
        self.viewBoard.addSubview(self.view)
        self.viewBoard.items.append(self.view)
    }
    
    private func addLayout() {
        let viewModel:ViewModelNewCard = self.viewModel as! ViewModelNewCard
        self.view.layoutWidth = self.view.widthAnchor.constraint(equalToConstant:viewModel.width)
        self.view.layoutHeight = self.view.heightAnchor.constraint(equalToConstant:viewModel.height)
        self.view.layoutTop = self.view.topAnchor.constraint(
            equalTo:self.viewBoard.topAnchor, constant:viewModel.top)
        self.view.layoutLeft = self.view.leftAnchor.constraint(
            equalTo:self.viewBoard.leftAnchor, constant:viewModel.left)
        self.view.savePosition()
    }
    
    private func activateLayout() {
        self.view.layoutWidth.isActive = true
        self.view.layoutHeight.isActive = true
        self.view.layoutTop.isActive = true
        self.view.layoutLeft.isActive = true
    }
}
