import Foundation
import CleanArchitecture
import Domain

class LibraryPresenter:Presenter {
    var interactor:LibraryInteractor!
    var viewModels:ViewModels!
    
    required init() { }
    
    func didAppear() {
        self.showLoading()
        self.interactor.load()
    }
    
    func shouldUpdate() {
        if self.interactor.library.boards.isEmpty {
            self.showEmpty()
        } else {
            self.showItems()
        }
    }
    
    @objc func newBoard() {
        self.showLoading()
        self.interactor.newBoard()
    }
    
    @objc func selected(cell:LibraryCellView) {
        cell.highlight()
    }
    
    private func showLoading() {
        var viewModel:LibraryViewModel = LibraryViewModel()
        viewModel.loadingHidden = false
        self.viewModels.update(viewModel:viewModel)
    }
    
    private func showEmpty() {
        var viewModel:LibraryViewModel = LibraryViewModel()
        viewModel.message = NSLocalizedString("LibraryPresenter.empty", comment:String())
        self.viewModels.update(viewModel:viewModel)
    }
    
    private func showItems() {
        var viewModel:LibraryViewModel = LibraryViewModel()
        viewModel.items = self.items
        self.viewModels.update(viewModel:viewModel)
    }
    
    private var items:[LibraryItemViewModel] { get {
        var items:[LibraryItemViewModel] = []
        self.interactor.library.boards.forEach { (key:String, board:BoardProtocol) in
            var item:LibraryItemViewModel = LibraryItemViewModel()
            item.board = key
            item.name = board.name
            items.append(item)
        }
        return items.sorted { (left:LibraryItemViewModel, right:LibraryItemViewModel) -> Bool in
            return left.name.caseInsensitiveCompare(right.name) == ComparisonResult.orderedAscending
        }
    } }
}
