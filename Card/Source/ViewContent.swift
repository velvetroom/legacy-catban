import UIKit

public class ViewContent:UIView {
    weak var viewText:ViewText!
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeText()
        self.layoutText()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    private func makeText() {
        let viewText:ViewText = ViewText()
        self.viewText = viewText
        self.addSubview(viewText)
    }
    
    private func layoutText() {
        self.viewText.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.viewText.leftAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.viewText.rightAnchor.constraint(equalTo:self.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
