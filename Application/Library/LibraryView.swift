import Foundation
import CleanArchitecture

class LibraryView:View<LibraryPresenter> {
    weak var loading:LoadingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    private func makeOutlets() {
        let loading:LoadingView = LoadingView()
        loading.tintColor = Colors.navyBlue
        self.loading = loading
        self.view.addSubview(loading)
    }
    
    private func layoutOutlets() {
        self.loading.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        self.loading.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
    }
}
