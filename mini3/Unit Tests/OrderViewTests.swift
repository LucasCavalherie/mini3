//
//  mini3Tests.swift
//  mini3Tests
//
//  Created by Lucas Cavalherie on 01/11/23.
//

import XCTest
@testable import mini3

final class OrderViewTests: XCTestCase {
    var viewModel: OrderViewModel?

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testOrderViewModel_WhenListAllOrder_ReturnTwoOrder() throws {
        viewModel = OrderViewModel.shared
        viewModel!.orders = [
            OrderModel(
                orderName: "Pedido 1",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .toDo,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            ),
            OrderModel(
                orderName: "Pedido 2",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .toDo,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            )
        ]
        
        
        let orders = viewModel!.listAllOrders()
        
        XCTAssertEqual(2, orders.count)
        XCTAssertEqual("Pedido 1", orders[0].orderName)
        XCTAssertEqual("Pedido 2", orders[1].orderName)
    }
    
    func testOrderViewModel_WhenListFinishOrders_ReturnOnlyCanceledOrDelivered() throws {
        viewModel = OrderViewModel.shared
        viewModel!.orders = [
            OrderModel(
                orderName: "Pedido 1",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .toDo,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            ),
            OrderModel(
                orderName: "Pedido 2",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .doing,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            ),
            OrderModel(
                orderName: "Pedido 3",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .done,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            ),
            OrderModel(
                orderName: "Pedido 4",
                deliveryDate: Date(),
                observation: "observação",
                value: 10.0,
                isPaid: true,
                status: .canceled,
                customer: CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
                orderItems: []
            )
        ]
        
        
        let orders = viewModel!.listFinishedOrders()
        
        XCTAssertEqual(2, orders.count)
        XCTAssertEqual("Pedido 3", orders[0].orderName)
        XCTAssertEqual("Pedido 4", orders[1].orderName)
    }

}
