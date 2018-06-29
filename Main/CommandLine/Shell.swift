import Foundation

class Shell {
    private let pipe:Pipe
    
    init() {
        self.pipe = Pipe()
    }
    
    func execute(input:String) -> String {
        let process:Process = self.makeProcessWith(input:input)
        process.launch()
        process.waitUntilExit()
        return self.readFromPipe()
    }
    
    private func makeProcessWith(input:String) -> Process {
        let process:Process = Process()
        process.standardOutput = self.pipe
        process.launchPath = Constants.Shell.environment
        process.arguments = self.makeArgumentsFrom(input:input)
        process.environment = [Constants.Shell.encodingKey : Constants.Shell.encodingValue,
                               Constants.Shell.homeKey : NSHomeDirectory()]
        return process
    }
    
    private func makeArgumentsFrom(input:String) -> [String] {
        return input.split(separator:Constants.Shell.separator).map { (substring:Substring) -> String in
            return String(substring)
        }
    }
    
    private func readFromPipe() -> String {
        let data:Data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard
            let string:String = String(data:data, encoding:String.Encoding.utf8)
        else { return String() }
        return string
    }
}
