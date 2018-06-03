import Foundation
@testable import Projects

class MockViewListCell:ViewListCell {
    static var cell:MockViewListCell?
    
    override func updateState() {
        MockViewListCell.cell = self
    }
}
