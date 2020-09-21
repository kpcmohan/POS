import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "http://iroidtechnologies.in/friday/index.php"
    }
    struct APIParameterKey {
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
