//
//  OrderViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

class OrderViewModel: ObservableObject {
    static let shared = OrderViewModel()
    
    private init() {}
    
    let sharedUserDefaults = UserDefaults()
    let orderKey = "order"
    
    @Published var orders : [OrderModel] = []
    @Published var currentOrder : OrderModel?
    
    func getOrderIndex(id: UUID) -> Int? {
        return orders.firstIndex(where: { $0.id == id })
    }
    
    func addOrder(orderName: String, deliveryDate: Date, observation: String, value: Double, isPaid: Bool, customerName: String, customerContact: String, contactForm: ContactForm) {
        let orderItems = OrderItemViewModel.shared.listOrderItem()
        let customerModel = CustomerModel(name: customerName, contact: customerContact, contactForm: contactForm)
        orders.append(OrderModel(orderName: orderName, deliveryDate: deliveryDate, observation: observation, value: value, isPaid: isPaid, status: .toDo, customer: customerModel, orderItems: orderItems))
    }
    
    func editOrder(id: UUID, orderName: String, deliveryDate: Date, observation: String, value: Double, isPaid: Bool, customerName: String, customerContact: String, contactForm: ContactForm) {
        let orderItems = OrderItemViewModel.shared.listOrderItem()
        if let index = getOrderIndex(id: id) {
            orders[index].orderName = orderName
            orders[index].deliveryDate = deliveryDate
            orders[index].observation = observation
            orders[index].value = value
            orders[index].isPaid = isPaid
            orders[index].orderItems = orderItems
            orders[index].customer.name = customerName
            orders[index].customer.contact = customerContact
            orders[index].customer.contactForm = contactForm
        }
    }
    
    func removeOrder(id: UUID) {
        if let index = getOrderIndex(id: id) {
            orders.remove(at: index)
        }
    }
    
    func previousStatus() {
        let id = currentOrder!.id
        switch currentOrder!.status {
            case .done:
                changeStatus(id: id, status: .packing)
            case .packing:
                changeStatus(id: id, status: .doing)
            case .doing:
                changeStatus(id: id, status: .toDo)
            default:
                break
        }
    }
    
    func nextStatus() {
        let id = currentOrder!.id
        switch currentOrder!.status {
            case .toDo:
                changeStatus(id: id, status: .doing)
            case .doing:
                changeStatus(id: id, status: .packing)
            case .packing:
                changeStatus(id: id, status: .done)
            default:
                break
        }
    }
    
    func changeStatus(id: UUID, status: OrderStatus) {
        if let index = getOrderIndex(id: id) {
            currentOrder!.status = status
            orders[index].status = status
        }
    }
    
    func listAllOrders() -> [OrderModel] {
        return orders
    }
    
    func listUpcomingDeliveries() -> [OrderModel] {
        let today = Date()

        return orders.filter { order in
            let isToDoOrDoing = order.status == .toDo || order.status == .doing
            let isDeliveryToday = Calendar.current.isDate(order.deliveryDate, inSameDayAs: today)
            return isToDoOrDoing && isDeliveryToday
        }
    }
    
    func listNotFinishedOrders() -> [OrderModel] {
        return orders.filter { order in
            return order.status == .toDo || order.status == .doing || order.status == .packing || order.status == .toDeliver
        }
    }
    
    func listFinishedOrders() -> [OrderModel] {
        return orders.filter { order in
            return order.status == .done || order.status == .canceled
        }
    }
    
    func listOrdersByStatus(status: OrderStatus) -> [OrderModel] {
        return orders.filter { order in
            return order.status == status
        }
    }
    
    func getOrder(id: UUID) -> OrderModel? {
        return orders.filter{$0.id == id}.first
    }
}
