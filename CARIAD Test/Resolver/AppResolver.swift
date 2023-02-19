//
//  ChargingStationsResolver.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { ChargingStationsService() as ChargingStationsServiceProtocol }
    }
}

func resolve<TService>(name: Resolver.Name? = nil, args: Any? = nil) -> TService {
    Resolver.resolve(name: name, args: args)
}
