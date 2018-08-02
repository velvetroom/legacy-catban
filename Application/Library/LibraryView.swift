import Foundation
import CleanArchitecture

class LibraryView:View<LibraryPresenter> {
    weak var loading:LoadingView!
    weak var scroll:UIScrollView!
    weak var message:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("LibraryView.title", comment:String())
        self.makeOutlets()
        self.layoutOutlets()
        self.configureViewModel()
    }
    
    private func makeOutlets() {
        let scroll:UIScrollView = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        self.scroll = scroll
        self.view.addSubview(scroll)
        
        let message:UILabel = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont.systemFont(ofSize:Constants.font, weight:UIFont.Weight.light)
        message.textColor = UIColor(white:0, alpha:0.8)
        message.numberOfLines = 0
        message.isUserInteractionEnabled = false
        self.message = message
        self.view.addSubview(message)
        
        let loading:LoadingView = LoadingView()
        loading.tintColor = Colors.navyBlue
        self.loading = loading
        self.view.addSubview(loading)
    }
    
    private func layoutOutlets() {
        self.scroll.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        self.scroll.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        
        self.message.leftAnchor.constraint(equalTo:self.view.leftAnchor, constant:Constants.margin).isActive = true
        self.message.rightAnchor.constraint(equalTo:self.view.rightAnchor, constant:-Constants.margin).isActive = true
        self.message.heightAnchor.constraint(greaterThanOrEqualToConstant:0)
        
        self.loading.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        self.loading.centerYAnchor.constraint(equalTo:self.view.centerYAnchor).isActive = true
        
        if #available(iOS 11.0, *) {
            self.scroll.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.scroll.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            self.message.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor,
                                              constant:Constants.margin).isActive = true
        } else {
            self.scroll.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
            self.scroll.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
            self.message.topAnchor.constraint(equalTo:self.view.topAnchor, constant:Constants.margin).isActive = true
        }
    }
    
    private func configureViewModel() {
        self.presenter.viewModels.observe { [weak self] (viewModel:LibraryViewModel) in
            self?.loading.isHidden = viewModel.loadingHidden
            self?.message.text = viewModel.message
            self?.update(items:viewModel.items)
        }
    }
    
    private func update(items:[LibraryItemViewModel]) {
        
    }
}

private struct Constants {
    static let font:CGFloat = 16
    static let margin:CGFloat = 20
}
