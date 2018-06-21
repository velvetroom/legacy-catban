import Foundation

public class PresenterDeleteFactory {
    public static func makePresenter() -> PresenterDeleteProtocol {
        return PresenterDelete()
    }
    
    private init() { }
}
