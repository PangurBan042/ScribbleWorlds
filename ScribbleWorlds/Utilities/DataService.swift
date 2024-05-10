//
//  DataService.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/24/22.
//
import Foundation

class DataService: Codable{
    
    static func getData<T: Codable>(_ file:String) -> T {
        
        /// Parse local JSON file
        /// Get a URL path to the JSON FIle
        let pathString = Bundle.main.path(forResource:file, ofType: "json")
       
        /// Check to see if pathString is formed correctly, otherwise return empty biome
        guard pathString != nil else {
            return file as! T
            
        } /// End of guard for pathString
        
        ///Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            /// Create data object from  data found at url
            let data = try Data(contentsOf: url)
            
            /// Create JSON decoder to translate data into class info
            let decoder = JSONDecoder()
            
            do {
                let loaded = try decoder.decode(T.self, from: data)
                return loaded
            } /// End of do for second do/catch
            catch {
                print(error)
            } /// End of catch for second do/catch
        } /// End of do for first do/catch
        catch {
            print (error)
        } /// End of catch for first do/catch
        
        return file as! T
        
        // End of do for first do/catch statment
    } // End of getBiomeData()
} // End of DataService
