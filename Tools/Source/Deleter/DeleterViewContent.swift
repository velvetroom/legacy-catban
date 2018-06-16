import UIKit

class DeleterViewContent:UIView {
    weak var background:UIView!
    weak var viewMenu:UIView!
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
    }
    
    private func makeOutlets() {
        
    }
    
    private func layoutOutlets() {
        
    }
    
    private func makeBackground() {
        
    }
    
    private func makeMenu() {
        
    }
    
    private func layoutBackground() {
        
    }
    
    private func layoutMenu() {
        
    }
}
