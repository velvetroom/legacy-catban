import UIKit
@testable import catban

class MockOrganiseViewCollection:OrganiseViewCollection {
    var cell:OrganiseViewCollectionCell
    
    override init() {
        self.cell = OrganiseViewCollectionCell(frame:CGRect.zero)
        super.init()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func dequeueReusableCell(withReuseIdentifier:String, for:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
}
