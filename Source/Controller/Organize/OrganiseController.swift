import Foundation

class OrganiseController:Controller, ControllerProtocol {
    var model:OrganiseProtocol
    
    override init() {
        self.model = Organise()
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
