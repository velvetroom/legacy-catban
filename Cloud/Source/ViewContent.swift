import UIKit

public class ViewContent:UIView {
    weak var viewNotClouded:ViewNotClouded!
    
    public init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.white
    }
    
    private func makeOutlets() {
       self.makeNotClouded()
    }
    
    private func layoutOutlets() {
        self.layoutNotClouded()
    }
    
    private func makeNotClouded() {
        let viewNotClouded:ViewNotClouded = ViewNotClouded()
        self.viewNotClouded = viewNotClouded
        self.addSubview(viewNotClouded)
    }
    
    private func layoutNotClouded() {
        self.viewNotClouded.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.viewNotClouded.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
        self.viewNotClouded.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.viewNotClouded.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
    }
}
