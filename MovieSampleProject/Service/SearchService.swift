import UIKit
import Foundation
import ObjectMapper
import Alamofire
class SearchService {
    let http = HTTP();
    func search(param: Parameters?,result: @escaping ([Search]) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLProfile(),param: param){ (data) in
        let _data = Mapper<SearchResponse>().map(JSONString: String(decoding: data, as: UTF8.self))
            result(_data!.search!)
        };
    }
}
