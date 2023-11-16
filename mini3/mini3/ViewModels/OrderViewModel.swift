//
//  OrderViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

class OrderViewModel: ObservableObject {
    static let shared = OrderViewModel()
    
    private init() {
        loadOrders()
    }
    
    @Published var orders : [OrderModel] = [] { didSet { saveOrders() } }
    @Published var currentOrder : OrderModel?
    
    // Saving Data
    let sharedUserDefaults = UserDefaults.standard
    let orderKey = "order"

    private func loadOrders() {
        if let data = sharedUserDefaults.data(forKey: orderKey),
           let decodedOrders = try? JSONDecoder().decode([OrderModel].self, from: data) {
            orders = decodedOrders
        }
    }

    private func saveOrders() {
        if let encodedOrders = try? JSONEncoder().encode(orders) {
            sharedUserDefaults.set(encodedOrders, forKey: orderKey)
        }
    }
    
    func clearOrders() {
        sharedUserDefaults.removeObject(forKey: orderKey)
        orders = []
    }
    
    // Functions
    
    func getOrderIndex(id: UUID) -> Int? {
        return orders.firstIndex(where: { $0.id == id })
    }
    
    func addOrder(orderName: String, deliveryDate: Date, observation: String, value: Double, isPaid: Bool, customerName: String, customerContact: String, contactForm: ContactForm) {
        let orderItems = OrderItemViewModel.shared.listOrderItem()
        OrderItemViewModel.shared.orderItemModels = []
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
            currentOrder = orders[index]
        }
    }
    
    func removeOrder(id: UUID) {
        if let index = getOrderIndex(id: id) {
            orders.remove(at: index)
        }
    }
    
    func markAsPaid(id: UUID) {
        if let index = getOrderIndex(id: id) {
            orders[index].isPaid = true
            currentOrder?.isPaid = true
        }
    }
    
    func markAsNotPaid(id: UUID) {
        if let index = getOrderIndex(id: id) {
            orders[index].isPaid = false
            currentOrder?.isPaid = false
        }
    }
    
    func previousStatus() {
        let id = currentOrder!.id
        switch currentOrder!.status {
            case .done:
                changeStatus(id: id, status: .toDeliver)
            case .toDeliver:
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
                changeStatus(id: id, status: .toDeliver)
            case .toDeliver:
                changeStatus(id: id, status: .done)
            default:
                break
        }
    }
    
    func cancel() {
        let id = currentOrder!.id
        changeStatus(id: id, status: .canceled)
    }
    
    func changeStatus(id: UUID, status: OrderStatus) {
        if let index = getOrderIndex(id: id) {
            currentOrder!.status = status
            orders[index].status = status
        }
    }
    
    func listTodayOrders() -> [OrderModel] {
        let today = Date()

        return orders.filter { order in
            let isStatusActive = order.status == .toDo || order.status == .doing || order.status == .packing || order.status == .toDeliver
            let isDeliveryToday = Calendar.current.isDate(order.deliveryDate, inSameDayAs: today)
            return isStatusActive && isDeliveryToday
        }
    }
    
    func listNext7DaysOrders() -> [OrderModel] {
        let today = Date()
        let sevenDaysLater = Calendar.current.date(byAdding: .day, value: 8, to: today)!

        return orders.filter { order in
            let isStatusActive = order.status == .toDo || order.status == .doing || order.status == .packing || order.status == .toDeliver
            let isDeliveryNext7Days = today..<sevenDaysLater ~= order.deliveryDate
            return isStatusActive && isDeliveryNext7Days
        }
    }
    
    func listNext30DaysOrders() -> [OrderModel] {
        let today = Date()
        let next7DaysLater = Calendar.current.date(byAdding: .day, value: 8, to: today)!
        let next30DaysLater = Calendar.current.date(byAdding: .day, value: 30, to: today)!

        return orders.filter { order in
            let isStatusActive = order.status == .toDo || order.status == .doing || order.status == .packing || order.status == .toDeliver
            let isDeliveryNext30Days = next7DaysLater..<next30DaysLater ~= order.deliveryDate
            return isStatusActive && isDeliveryNext30Days
        }
    }
    
    func sortOrdersByStatus(_ orders: [OrderModel]) -> [OrderModel] {
        return orders.sorted { (order1, order2) in
            // Obtém a ordem numérica do enum para comparar
            let orderValueOrder1 = order1.getStatusValue()
            let orderValueOrder2 = order2.getStatusValue()

            // Ordena com base nas ordens numéricas obtidas
            return orderValueOrder1 < orderValueOrder2
        }
    }
    
    func listAllOrders() -> [OrderModel] {
        return sortOrdersByStatus(orders)
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
