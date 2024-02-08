
import SwiftUI

class ViewModel : ObservableObject {
    @Published var arrayPhotosDay : [PhotosDAY] = []
    @Published var arrayPhotosDayTraduzido : [PhotosDAY2] = []
    @Published var arrayInfo : [Info] = []
    @Published var arrayFoguetes : [Foguetes] = []
    @Published var arrayNoticias : [Noticias] = []
    
   
    func fotos(){
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=mgiCGzPL0waPLzPFLXc4wGLmF3KBx1wLajfhkEAH" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(PhotosDAY.self, from: data)
                
                DispatchQueue.main.async {
                   // self?.arrayPhotosDay = parsed
                    self?.arrayPhotosDay = []
                    self?.arrayPhotosDay.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func foguetes(){
        guard let url = URL(string: "http://192.168.128.39:1880/lerfoguetes" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Foguetes].self, from: data)
                
                DispatchQueue.main.async {
                   self?.arrayFoguetes = parsed
                   // self?.arrayFoguetes.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    func info(){
        guard let url = URL(string: "http://192.168.128.39:1880/lerinfo" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Info].self, from: data)
                
                DispatchQueue.main.async {
                    self?.arrayInfo = parsed
                    //self?.arrayInfo.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    func noticias(){
        guard let url = URL(string: "http://192.168.128.39:1880/lernoticias" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Noticias].self, from: data)
                
                DispatchQueue.main.async {
                   self?.arrayNoticias = parsed
                    //self?.arrayNoticias.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    func FUNCIONA(){
        guard let url = URL(string: "http://127.0.0.1:1880/lertraduzido" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([PhotosDAY].self, from: data)
                
                DispatchQueue.main.async {
                    self?.arrayPhotosDayTraduzido = []
                    self?.arrayPhotosDayTraduzido.append(PhotosDAY2(date: parsed[0].date, explanation: parsed[0].explanation, hdurl: parsed[0].hdurl, title: parsed[0].title))
                    //self?.arrayNoticias.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
        
    }
    func pust(_ obj : PhotosDAY2){
        
        
        guard let url = URL(string: "http://127.0.0.1:1880/update") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
    }
    
    
    
}
