import Foundation
import Shared
import Board

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func updateWith(viewModel:ViewModel) {
        self.updateViewWith(viewModel:viewModel.view)
        self.updateScrollWith(viewModel:viewModel.scroll)
        self.updateBoardWith(viewModel:viewModel.board)
        self.updateColumnsWith(columns:viewModel.columns)
        self.updateCardsWith(cards:viewModel.cards)
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() {
        let builder:ViewModelBuilder = ViewModelBuilder()
        builder.buildWith(project:controller.project)
        self.updateWith(viewModel:builder.viewModel)
    }
    
    private func loadOutlets(view:Shared.View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.loadFor(view:view)
        self.outlets = loader.outlets
    }
    
    private func updateViewWith(viewModel:ViewModelView) {
        self.outlets.view?.title = viewModel.title
    }
    
    private func updateScrollWith(viewModel:ViewModelScroll) {
        self.outlets.viewScroll?.contentSize = viewModel.contentSize
    }
    
    private func updateBoardWith(viewModel:ViewModelBoard) {
        self.outlets.viewBoard?.frame = viewModel.frame
    }
    
    private func updateColumnsWith(columns:[ViewModelColumn]) {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.removePreviousColumnsFrom(viewBoard:viewBoard)
        for column:ViewModelColumn in columns {
            self.addColumnWith(viewModel:column, to:viewBoard)
        }
    }
    
    private func removePreviousColumnsFrom(viewBoard:ViewBoard) {
        for column:ViewColumn in viewBoard.columns {
            column.removeFromSuperview()
        }
        viewBoard.columns = []
    }
    
    private func addColumnWith(viewModel:ViewModelColumn, to viewBoard:ViewBoard) {
        let view:ViewColumn = ViewColumn()
        self.addColumn(view:view, to:viewBoard)
        view.layoutLeft.constant = viewModel.left
        view.labelName.text = viewModel.name
    }
    
    private func addColumn(view:ViewColumn, to viewBoard:ViewBoard) {
        viewBoard.addSubview(view)
        viewBoard.columns.append(view)
        
        view.topAnchor.constraint(equalTo:viewBoard.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:viewBoard.bottomAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant:ViewConstants.Column.width).isActive = true
        view.layoutLeft = view.leftAnchor.constraint(equalTo:viewBoard.leftAnchor)
        view.layoutLeft.isActive = true
    }
    
    private func updateCardsWith(cards:[ViewModelCard]) {
        guard
            let viewBoard:ViewBoard = self.outlets.viewBoard
        else { return }
        self.removePreviousCardsFrom(viewBoard:viewBoard)
        for card:ViewModelCard in cards {
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
        view.layoutWidth.constant = viewModel.width
        view.layoutHeight.constant = viewModel.height
        view.layoutTop.constant = viewModel.top
        view.layoutLeft.constant = viewModel.left
        view.labelContent.text = viewModel.content
        
        view.layoutWidth.isActive = true
        view.layoutHeight.isActive = true
        view.layoutTop.isActive = true
        view.layoutLeft.isActive = true
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
}
