import Foundation

extension Project {
    func move(cardIndex:Int, to destination:Int, in columnIndex:Int) {
        let column:ProjectColumn = self.columns[columnIndex]
        let card:ProjectCard = column.remove(card:cardIndex)
        column.insert(card:card, at:destination)
    }
}
