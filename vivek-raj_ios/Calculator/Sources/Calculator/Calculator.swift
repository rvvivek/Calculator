@main
public struct Calculator {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(Calculator().text)
    }
}
