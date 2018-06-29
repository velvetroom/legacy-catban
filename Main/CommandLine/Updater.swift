import Foundation

class Updater {
    let arguments:[String]
    
    init() {
        self.arguments = CommandLine.arguments
        self.update()
    }
    
    private func update() {
        let commits:String = self.arguments[1]
        print("commits \(commits)")
        print(self.loadFile())
    }
    
    private func loadFile() -> String {
        let url:URL = URL(fileURLWithPath:"../Configuration/source.plist")
        let string:String
        do {
            try string = String(contentsOf:url)
        } catch {
            return String()
        }
        return string
    }
}
