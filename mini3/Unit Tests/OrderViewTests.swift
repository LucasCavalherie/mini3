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
    
    override func setUp() {
        viewModel = OrderViewModel.shared
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testOrderViewModel_WhenListAllOrder_ReturnTwoOrder() throws {
        let vm = try XCTUnwrap(viewModel)
        vm.orders = [
            .create(orderName: "Pedido 1"),
            .create(orderName: "Pedido 2"),
        ]
        
        let orders = vm.listAllOrders()
        
        XCTAssertEqual(2, orders.count)
        XCTAssertEqual("Pedido 1", orders[0].orderName)
        XCTAssertEqual("Pedido 2", orders[1].orderName)
    }
    
    func testOrderViewModel_WhenListFinishOrders_ReturnOnlyCanceledOrDone() throws {
        viewModel!.orders = [
            .create(orderName: "Pedido 1", status: .toDo),
            .create(orderName: "Pedido 2", status: .doing),
            .create(orderName: "Pedido 3", status: .packing),
            .create(orderName: "Pedido 4", status: .toDeliver),
            .create(orderName: "Pedido 5", status: .done),
            .create(orderName: "Pedido 6", status: .canceled),
        ]
        
        
        let orders = viewModel!.listFinishedOrders()
        
        XCTAssertEqual(2, orders.count)
        XCTAssertEqual("Pedido 5", orders[0].orderName)
        XCTAssertEqual("Pedido 6", orders[1].orderName)
    }
    
    func testOrderViewModel_WhenListNotFinishOrders_NotReturnCanceledOrDone() throws {
        viewModel!.orders = [
            .create(orderName: "Pedido 1", status: .toDo),
            .create(orderName: "Pedido 2", status: .doing),
            .create(orderName: "Pedido 3", status: .packing),
            .create(orderName: "Pedido 4", status: .toDeliver),
            .create(orderName: "Pedido 5", status: .done),
            .create(orderName: "Pedido 6", status: .canceled),
        ]
        
        
        let orders = viewModel!.listNotFinishedOrders()
        
        XCTAssertEqual(4, orders.count)
        XCTAssertEqual("Pedido 1", orders[0].orderName)
        XCTAssertEqual("Pedido 2", orders[1].orderName)
        XCTAssertEqual("Pedido 3", orders[2].orderName)
        XCTAssertEqual("Pedido 4", orders[3].orderName)
    }
    
    func testOrderViewModel_WhenListOrdersByStatus_ReturnOnlyToDoStatus() throws {
        viewModel!.orders = [
            .create(orderName: "Pedido 1.1", status: .toDo),
            .create(orderName: "Pedido 1.2", status: .toDo),
            .create(orderName: "Pedido 1.3", status: .toDo),
            .create(orderName: "Pedido 2", status: .doing),
            .create(orderName: "Pedido 3", status: .packing),
            .create(orderName: "Pedido 4", status: .toDeliver),
            .create(orderName: "Pedido 5", status: .done),
            .create(orderName: "Pedido 6", status: .canceled),
        ]
        
        
        let orders = viewModel!.listOrdersByStatus(status: .toDo)
        
        XCTAssertEqual(3, orders.count)
        XCTAssertEqual("Pedido 1.1", orders[0].orderName)
        XCTAssertEqual("Pedido 1.2", orders[1].orderName)
        XCTAssertEqual("Pedido 1.3", orders[2].orderName)
    }
    
    func testOrderViewModel_WhenListUpcomingDeliveries_ReturnOnlyToDoAndDoingForToday() throws {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)

        viewModel!.orders = [
            // Should return
            .create(orderName: "Pedido 1", deliveryDate: now, status: .toDo),
            .create(orderName: "Pedido 2", deliveryDate: now, status: .doing),
            
            // Not return
            .create(orderName: "Pedido 1", deliveryDate: tomorrow, status: .toDo),
            .create(orderName: "Pedido 2", deliveryDate: tomorrow, status: .doing),
            .create(orderName: "Pedido 3", deliveryDate: now, status: .packing),
            .create(orderName: "Pedido 4", deliveryDate: now, status: .toDeliver),
            .create(orderName: "Pedido 5", deliveryDate: now, status: .done),
            .create(orderName: "Pedido 6", deliveryDate: now, status: .canceled),
            .create(orderName: "Pedido 7", deliveryDate: tomorrow, status: .packing),
            .create(orderName: "Pedido 8", deliveryDate: tomorrow, status: .toDeliver),
            .create(orderName: "Pedido 9", deliveryDate: tomorrow, status: .done),
            .create(orderName: "Pedido 10", deliveryDate: tomorrow, status: .canceled),
        ]
        
        
        let orders = viewModel!.listUpcomingDeliveries()
        
        XCTAssertEqual(2, orders.count)
        XCTAssertEqual("Pedido 1", orders[0].orderName)
        XCTAssertEqual("Pedido 2", orders[1].orderName)
    }
    
    func testOrderViewModel_WhenListUpcomingDeliveries_ReturnEmpty() throws {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)

        viewModel!.orders = [
            // Not return
            .create(orderName: "Pedido 1", deliveryDate: tomorrow, status: .toDo),
            .create(orderName: "Pedido 2", deliveryDate: tomorrow, status: .doing),
            .create(orderName: "Pedido 3", deliveryDate: now, status: .packing),
            .create(orderName: "Pedido 4", deliveryDate: now, status: .toDeliver),
            .create(orderName: "Pedido 5", deliveryDate: now, status: .done),
            .create(orderName: "Pedido 6", deliveryDate: now, status: .canceled),
            .create(orderName: "Pedido 7", deliveryDate: tomorrow, status: .packing),
            .create(orderName: "Pedido 8", deliveryDate: tomorrow, status: .toDeliver),
            .create(orderName: "Pedido 9", deliveryDate: tomorrow, status: .done),
            .create(orderName: "Pedido 10", deliveryDate: tomorrow, status: .canceled),
        ]
        
        
        let orders = viewModel!.listUpcomingDeliveries()
        
        XCTAssertEqual(0, orders.count)
    }
    
    func testOrderViewModel_WhenGetOrder_ReturnOnlySpecificOrder() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1", observation: "bla bla"),
            .create(orderName: "Pedido 2", observation: "ble ble"),
        ]
        
        viewModel!.orders = listOrders
        
        
        let order = viewModel!.getOrder(id: listOrders[0].id)!
        
        XCTAssertEqual("Pedido 1", order.orderName)
        XCTAssertEqual("bla bla", order.observation)
    }
    
    func testOrderViewModel_WhenChangeStatus_ReturnOrderWithDifferentStatus() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1", status: .toDo),
            .create(orderName: "Pedido 2", status: .canceled),
        ]
        
        viewModel!.orders = listOrders
        viewModel!.currentOrder = listOrders[0]
        viewModel!.changeStatus(id: listOrders[0].id, status: .canceled)
        
        var order = viewModel!.orders[0]
        XCTAssertEqual("Pedido 1", order.orderName)
        XCTAssertEqual(.canceled, order.status)
    }
    
    func testOrderViewModel_WhenNextStatus_ShouldChangeToDoToDoing() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1", status: .toDo),
            .create(orderName: "Pedido 2", status: .canceled),
        ]
        
        viewModel!.orders = listOrders
        viewModel!.currentOrder = listOrders[0]
        viewModel!.nextStatus()
        
        var order = viewModel!.currentOrder!
        XCTAssertEqual("Pedido 1", order.orderName)
        XCTAssertEqual(.doing, order.status)
    }
    
    func testOrderViewModel_WhenPreviousStatus_ShouldChangeToDoingToDo() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1", status: .doing),
            .create(orderName: "Pedido 2", status: .canceled),
        ]
        
        viewModel!.orders = listOrders
        viewModel!.currentOrder = listOrders[0]
        viewModel!.previousStatus()
        
        var order = viewModel!.currentOrder!
        XCTAssertEqual("Pedido 1", order.orderName)
        XCTAssertEqual(.toDo, order.status)
    }
    
    func testOrderViewModel_WhenRemoveOrder_ShouldRemoveToList() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1"),
            .create(orderName: "Pedido 2"),
        ]
        
        viewModel!.orders = listOrders
        viewModel!.removeOrder(id: listOrders[0].id)
        
        var orders = viewModel!.orders
        XCTAssertEqual(1, orders.count)
        XCTAssertEqual("Pedido 2", orders[0].orderName)
    }
    
    func testOrderViewModel_WhenEditOrder_ShouldChangeOrder() throws {
        var listOrders : [OrderModel] = [
            .create(
                orderName: "Pedido 1",
                deliveryDate: Date.now,
                observation: "Obs",
                value: 10,
                isPaid: true,
                status: .toDo,
                customer: CustomerModel(name: "Lucas", contact: "contact", contactForm: .instagram),
                orderItems: []
            ),
            .create(orderName: "Pedido 2"),
        ]
        
        let date = Date.now.addingTimeInterval(600)
        viewModel!.orders = listOrders
        viewModel!.editOrder(
            id: listOrders[0].id,
            orderName: "Pedido 2",
            deliveryDate: date,
            observation: "obs2",
            value: 11,
            isPaid: false,
            customerName: "luquinhas",
            customerContact: "contatinho",
            contactForm: .whatsapp
        )
        
        var order = viewModel!.orders[0]
        XCTAssertEqual("Pedido 2", order.orderName)
        XCTAssertEqual(date, order.deliveryDate)
        XCTAssertEqual("obs2", order.observation)
        XCTAssertEqual(11, order.value)
        XCTAssertEqual(false, order.isPaid)
        XCTAssertEqual("luquinhas", order.customer.name)
        XCTAssertEqual("contatinho", order.customer.contact)
        XCTAssertEqual(.whatsapp, order.customer.contactForm)
    }
    
    func testOrderViewModel_WhenAddOrder_ShouldAddOrder() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1"),
        ]
        
        let date = Date.now.addingTimeInterval(600)
        viewModel!.orders = listOrders
        viewModel!.addOrder(
            orderName: "Pedido 2",
            deliveryDate: date,
            observation: "obs2",
            value: 11,
            isPaid: false,
            customerName: "luquinhas",
            customerContact: "contatinho",
            contactForm: .whatsapp
        )
        
        XCTAssertEqual(2, viewModel!.orders.count)
        var order = viewModel!.orders[1]
        XCTAssertEqual("Pedido 2", order.orderName)
        XCTAssertEqual(date, order.deliveryDate)
        XCTAssertEqual("obs2", order.observation)
        XCTAssertEqual(11, order.value)
        XCTAssertEqual(false, order.isPaid)
        XCTAssertEqual("luquinhas", order.customer.name)
        XCTAssertEqual("contatinho", order.customer.contact)
        XCTAssertEqual(.whatsapp, order.customer.contactForm)
    }
    
    func testOrderViewModel_WhenGetOrderIndex_ShouldGetIndex() throws {
        var listOrders : [OrderModel] = [
            .create(orderName: "Pedido 1"),
            .create(orderName: "Pedido 2"),
        ]
        
        viewModel!.orders = listOrders
        let index = viewModel!.getOrderIndex(id: listOrders[0].id)
        
        XCTAssertEqual(0, index)
    }

}
