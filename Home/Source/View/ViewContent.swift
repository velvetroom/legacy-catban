import UIKit

public class ViewContent:UIView {
    weak var viewCanvas:UIView!
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    func layoutCanvas() {
        self.viewCanvas.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewCanvas.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewCanvas.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewCanvas.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
    }
}
