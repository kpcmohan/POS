import Foundation
import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
                            completion(response.result)
        }
    }
    static func fetchHomeData(completion : @escaping (Result<FetchAllData,AFError>)->Void){
        performRequest(route: APIRouter.fetchHomeData, completion: completion)
    }
}
