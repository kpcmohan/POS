import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case fetchHomeData
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .fetchHomeData:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .fetchHomeData:
            return "?route=api/common"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .fetchHomeData:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        let urlWithPath = URL(string: url.appendingPathComponent(path).absoluteString.removingPercentEncoding!)!
        var urlRequest = URLRequest(url:urlWithPath)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
