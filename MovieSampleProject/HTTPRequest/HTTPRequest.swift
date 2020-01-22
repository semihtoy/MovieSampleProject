import Alamofire
class HTTP  {
    func get(url:String, param :Parameters?, result: @escaping (Data) -> Void    ) -> Void {
        AF.request(url, method: .get, parameters: param).response { response in
        print(response)
        result(response.data!)
            
          }
        }
    }
    func post() -> Void {
        
    }
    func put() -> Void {
        
    }
    func delete() -> Void {
        
    }

