package com.project.shop.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@Table(name = "t_device_case")
public class DeviceCase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "category", nullable = false, length = 24)
    private String category;

    @Column(name = "case_name", nullable = false)
    private String caseName;

    @Column(name = "color", nullable = false, length = 16)
    private String color;

    @Column(name = "device_manufacturer", nullable = false, length = 24)
    private String deviceManufacturer;

    @Column(name = "device_model", nullable = false, length = 24)
    private String deviceModel;

    @Column(name = "price", nullable = false)
    private Float price;

    @Column(name = "discount", nullable = false)
    private Short discount;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "available", nullable = false)
    private Boolean available = false;

}
