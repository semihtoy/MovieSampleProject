import Alamofire
import Foundation
import UIKit
class ProfileSearch {
    let http = HTTP();
    func getDetail(param: Parameters?,result: @escaping (Profile) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLProfile() ){ (data) in
            let jsonDecoder = JSONDecoder()
                  do
                          {
                            let responseModel = try jsonDecoder.decode(Profile.self, from: data)
                              if(responseModel == nil){
                              }
                            else{
                                result(responseModel)
                              }
                  } catch _ {
                          }
                }
            }
    }

