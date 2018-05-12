import Foundation

class PresenterUpdaterCards:PresenterUpdaterProtocol {
    var outlets:PresenterOutlets!
    var viewModel:ViewModel!
    var controller:Controller!
    
    required init() { }
    
    func update() {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.removePreviousCardsFrom(viewBoard:viewBoard)
        for card:ViewModelCard in self.viewModel.cards {
            self.addCardWith(viewModel:card, to:viewBoard)
        }
    }
    
    private func removePreviousCardsFrom(viewBoard:ViewBoard) {
        for card:ViewCard in viewBoard.cards {
            card.removeFromSuperview()
        }
        viewBoard.cards = []
    }
    
    private func addCardWith(viewModel:ViewModelCard, to viewBoard:ViewBoard) {
        let view:ViewCard = ViewCard()
        self.addCard(view:view, to:viewBoard)
        self.configure(view:view, with:viewModel)
        self.activateLayoutFrom(view:view)
    }
    
    private func addCard(view:ViewCard, to viewBoard:ViewBoard) {
        view.controller = self.controller
        viewBoard.addSubview(view)
        viewBoard.cards.append(view)
        
        view.layoutWidth = view.widthAnchor.constraint(equalToConstant:0)
        view.layoutHeight = view.heightAnchor.constraint(equalToConstant:0)
        view.layoutTop = view.topAnchor.constraint(equalTo:viewBoard.topAnchor)
        view.layoutLeft = view.leftAnchor.constraint(equalTo:viewBoard.leftAnchor)
    }
    
    private func configure(view:ViewCard, with viewModel:ViewModelCard) {
        view.identifier = viewModel.identifier
        view.layoutWidth.constant = viewModel.width
        view.layoutHeight.constant = viewModel.height
        view.layoutTop.constant = viewModel.top
        view.layoutLeft.constant = viewModel.left
        view.labelContent.text = viewModel.content
    }
    
    private func activateLayoutFrom(view:ViewCard) {
        view.layoutWidth.isActive = true
        view.layoutHeight.isActive = true
        view.layoutTop.isActive = true
        view.layoutLeft.isActive = true
    }
}
