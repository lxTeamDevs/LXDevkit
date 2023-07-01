//
//  LXDevkitNetworkLayerBaseRepository.swift
//  LXDevkitNetworkLayer
//
//  Created by Artak Gevorgyan on 01.07.23.
//  Copyright © 2023 LXTeamDevs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LXDevkitNetworkLayerBaseRepository<T: LXDevkitNetworkLayerTargetType> {
        
     var sessionManager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        let sessionManager = Session(configuration: configuration)
//        sessionManager.startRequestsImmediately = true
        return sessionManager
    }()

    func fetchData<M: Decodable>(target: T,
                                 responseClass: M.Type,
                                 encoding: URLEncoding = .default,
                                 completionHandler: @escaping (Result<M, Error>) -> Void) {

        let url = target.baseURL + target.path// + "?" + self.constructRequiredParams()
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        var parameters = buildParams(task: target.task)
        var finalParams = parameters.0
        self.printRequestDetails(url, headers, method, parameters)
        AF.request(url,
                   method: method,
                   parameters: finalParams,
                   encoding: encoding,
                   headers: headers).response { (responseObject) in
            guard let safeResponseObj = responseObject.response else {
//                completionHandler(.failure(Error.init(code: -1,
//                                                      message: "Texts.Common.Default.Error.message")))
                return
            }

            if// let safeResponseObj = responseObject.response,
               safeResponseObj.statusCode != 200 {
                if let data = responseObject.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    print("👹 Body: ", json)
                }

                self.printResponseObject(responseObject.response)
            } else {
                if let safeError = responseObject.error {
                    completionHandler(.failure(safeError))
                } else {
                    if let safeResponseObjData = responseObject.data {
                        var responseAsADict: [String: Any] = [:]
                        self.convertResponseToDictionary(safeResponseObjData) { (result, error) in
                            if error != nil {
                                print("🆘🆘🆘🆘 Could not convert data to Dictionary: ", error ?? "Error is nil")
                            } else if let result = result {
                                responseAsADict = result
                            } else {
                            }
                        }
                        if self.isStatusFieldContainsError(responseAsADict,
                                               statusCode: responseObject.response?.statusCode) {
                        } else {
                        }
                    } else {
                    }
                }
            }
        }
    }

    private func buildParams(task: LXDevkitNetworkLayerTask) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }

    private func printRequestDetails(_ url: String,
                                     _ headers: HTTPHeaders,
                                     _ method: Alamofire.HTTPMethod,
                                     _ parameters: ([String: Any], ParameterEncoding)) {
        print("➡️➡️➡️➡️➡️➡️➡️ Request start ➡️➡️➡️➡️➡️➡️➡️")
        print("➡️ URL: ", url)
        print("➡️ METHOD: ", method.rawValue)
        print("➡️ HEADERS: ", headers)
        print("➡️ PARAMS: ", parameters.0)
    }

    private func convertResponseToDictionary(_ responseObjectData: Data,
                                             completionHandler: @escaping ([String: Any]?, NSError?) -> Void) {
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: responseObjectData, options: []) as? [String: Any]
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("✅✅✅✅✅✅✅ Response start ✅✅✅✅✅✅✅")
                print("✅ DATA: ", jsonString)

            }
            completionHandler(jsonDict, nil)
        } catch {
            print("🐸  JSON parse error: ", error)
            completionHandler(nil, NSError(domain: "JSON error parse", code: 1, userInfo: nil))
        }
    }

    private func printResponseObject(_ responseObj: HTTPURLResponse?) {
        print("👹👹👹👹👹👹👹 Response fail 👹👹👹👹👹👹👹")
        print("👹 StatusCode: ", responseObj?.statusCode ?? "Object is nil")
        print("👹 Content-Type: ", responseObj?.headers.value(for: "Content-Type") ?? "Object is nil")
        print("👹 ResponseObject: ", responseObj ?? "Object is nil")
    }

    private func printResponseDetails(_ responseObjectDict: [String: Any]) {
            print("✅✅✅✅✅✅✅ Response start ✅✅✅✅✅✅✅")
            print("✅ DATA: ", responseObjectDict)
    }

    private func isStatusFieldContainsError(_ result: [String: Any], statusCode: Int?) -> Bool {
        if let statusCode = statusCode,
           statusCode != 200 {

            let containsError = result.contains { (key: String, value: Any) in
                let valueStr = value as? String
                return key == "status" && (valueStr == "ERROR" ||
                                           valueStr == "INVALID_DATA" ||
                                           valueStr == "NOT_FOUND" ||
                                           valueStr == "TOKEN_MISMATCH" ||
                                           valueStr == "UNAUTHORIZED" ||
                                           valueStr == "FORBIDDEN" ||
                                           valueStr == "APP_ERROR")
            }
            return containsError
        }
        return false
    }

}
