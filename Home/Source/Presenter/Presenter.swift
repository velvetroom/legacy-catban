import Foundation
import Shared
import Board

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Home.View.self
    var outlets:PresenterOutlets
    weak var controller:Controller!
    weak var delegate:PresenterDelegateProtocol?
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func updateWith(viewModel:ViewModel) {
        self.updateViewWith(viewModel:viewModel.view)
        self.updateScrollWith(viewModel:viewModel.scroll)
        self.updateBoardWith(viewModel:viewModel.board)
        self.updateColumnsWith(columns:viewModel.columns)
    }
    
    func didLoad(view:Shared.View) {
        self.loadOutlets(view:view)
        self.delegate?.didLoadPresenter()
    }
    
    func shouldUpdate() {
        let builder:ViewModelBuilder = ViewModelBuilder()
        builder.buildWith(project:self.controller.project)
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
}
