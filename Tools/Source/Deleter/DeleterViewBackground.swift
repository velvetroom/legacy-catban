import UIKit

class DeleterViewBackground:UIView {
    weak var button:UIButton!
    
    init() {
        super.init(frame:CGRect.zero)
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
}
