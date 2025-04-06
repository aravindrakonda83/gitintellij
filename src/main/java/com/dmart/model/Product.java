package com.dmart.model;

import lombok.Data;

@Data
public class Product {
    private int id;
    private String name;
    private double price;
    private String imageUrl;

    // Getters and Setters
}
