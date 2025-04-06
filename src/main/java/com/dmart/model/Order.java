package com.dmart.model;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Order {
    private int id;
    private int userId;
    private double totalAmount;
    private LocalDateTime orderDate;
    private List<OrderItem> items;
}
