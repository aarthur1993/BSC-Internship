//
//  Worker.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 20.05.2022.
//

import Foundation

class Worker {

    func fetch(complition: @escaping ((Welcome) -> Void)) {
        guard let url = createURLComponents() else { return }

        let session = URLSession.shared

        session.dataTask(with: url) { data, response, error in
            guard let response = response else { return }

            guard let data = data else { return }
            if let json = try? JSONDecoder().decode(Welcome.self, from: data) {
                complition(json)
            }

            do {
                let httpstatuscode = response as? HTTPURLResponse
                let statusCode = try self.test(httpstatuscode!.statusCode)
                print(statusCode)

            } catch Status.seccussful {
                print("Data received")
            } catch Status.failed {
                print("Client error")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    func createURLComponents() -> URL? {
        let urlComponent = URLComponents()
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/ios-test-ce687.appspot.com/o/Empty.json?alt=media&token=d07f7d4a-141e-4ac5-a2d2-cc936d4e6f18")

        return urlComponent.url(relativeTo: url)
    }

    enum Status: Error {
        case seccussful
        case failed
    }

    func test(_ statusCode: Int) throws -> String {
        switch statusCode {
        case 200...299:
            throw Status.seccussful
        case 300...403:
            throw Status.failed
        default:
            print("")

            return String(statusCode)
        }
    }
}

struct WelcomeElement: Decodable {
    var header, text: String
    var date: Int
}

typealias Welcome = [WelcomeElement]
