import Alamofire
import Foundation
import UIKit
class GetProfile {
    let http = HTTP();
    func getProfileData(result: @escaping ([Profile]) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLProfile() ){ (data) in
            let jsonDecoder = JSONDecoder()
            do
            {
                let responseModel = try jsonDecoder.decode([Profile].self, from: data)
                result(responseModel)
                
            } catch _ {
            }
        }
    }
}


