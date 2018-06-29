import UIKit

public class ViewContent:UIView {
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
    }
}
