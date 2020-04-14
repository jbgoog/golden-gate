//
//  Hub+LinkStatusService.swift
//  GoldenGate
//
//  Created by Sylvain Rebaud on 3/1/19.
//  Copyright © 2019 Fitbit. All rights reserved.
//

import Foundation
import RxBluetoothKit
import RxCocoa
import RxSwift

extension Hub {
    func remoteConnectionConfiguration(from characteristic: Characteristic) -> Observable<LinkStatusService.ConnectionConfiguration> {
        return Observable.merge(
                characteristic.observeValueUpdateAndSetNotification(),
                characteristic.readValue().asObservable()
            )
            .map {
                guard
                    let value = $0.value,
                    let configuration = LinkStatusService.ConnectionConfiguration(rawValue: value)
                else {
                    throw HubError.illegalConnectionConfiguration
                }

                return configuration
            }
    }

    func remoteConnectionStatus(from characteristic: Characteristic) -> Observable<LinkStatusService.ConnectionStatus> {
        return Observable.merge(
                characteristic.observeValueUpdateAndSetNotification(),
                characteristic.readValue().asObservable()
            )
            .map {
                guard
                    let value = $0.value,
                    let status = LinkStatusService.ConnectionStatus(rawValue: value)
                else {
                    throw HubError.illegalConnectionStatus
                }

                return status
            }
    }
}
