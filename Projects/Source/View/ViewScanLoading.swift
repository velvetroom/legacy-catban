import UIKit
import Tools

class ViewScanLoading:UIView {
    weak var spinner:Spinner!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
        self.spinner.startAnimating()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
    }
    
    private func makeOutlets() {
        self.makeSpinner()
    }
    
    private func layoutOutlets() {
        self.layoutSpinner()
    }
    
    private func makeSpinner() {
        let spinner:Spinner = Spinner()
        self.spinner = spinner
        self.addSubview(spinner)
    }
    
    private func layoutSpinner() {
        self.spinner.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
        self.spinner.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
    }
}
