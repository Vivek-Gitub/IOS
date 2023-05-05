import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true  // it is used to tell the playground to keep running, even if it has finished executing all the code in the playground page.

// https://jsonplaceholder.typicode.com/todos/1
func getData(){
    let session = URLSession.shared
    
    let serviceUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
    
    let task = session.dataTask(with: serviceUrl!){ (serviceData, serviceResponse, error) in
        if( error == nil){
            let httpsResponse = serviceResponse  as! HTTPURLResponse
            if(httpsResponse.statusCode == 200){
                // data parse
                let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers) // Jsonserialization throw exception so handle it
                //print(jsonData) in swift we have Dictionary which also kry-value pair
                
                let result = jsonData as! Dictionary<String, Any> //here we type cast json format to dictionary
                
                print(" Your is is  \(result["id"]!)")
            }
        }
    }
    task.resume() // IMportant it is used because API may take some time for fetching data
}

getData()
