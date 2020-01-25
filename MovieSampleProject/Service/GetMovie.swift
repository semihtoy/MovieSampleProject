import UIKit
import Foundation

class GetMovie {
    let http = HTTP();
    func getMovieData(result: @escaping ([Movie]) -> Void ) -> Void {
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

