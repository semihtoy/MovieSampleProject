import UIKit
import Foundation

class MovieSearch {
    let http = HTTP();
    func search(result: @escaping ([Movie]) -> Void ) -> Void {
        http.get(url:ServiceBase.getURLMovie()){ (data) in
        let jsonDecoder = JSONDecoder()
            do {

                let responseModel = try jsonDecoder.decode([Movie].self, from: data)
                result(responseModel)   
            } catch {
            }
            }

        }
    }

