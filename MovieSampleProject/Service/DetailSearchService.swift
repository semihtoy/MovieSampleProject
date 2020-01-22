import Alamofire
import Foundation
import UIKit
class DetailService {
    let http = HTTP();
    func getDetail(param: Parameters?,result: @escaping (Movie) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLMovie(),param: param ){ (data) in
            let _data = Mapper<Movie>().map(JSONString:  String(decoding: data, as: UTF8.self))
            print(_data?.title)
            result(_data!)
        };
    }
}
