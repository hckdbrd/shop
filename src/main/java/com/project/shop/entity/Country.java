package com.project.shop.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@Table(name = "t_country")
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "country_name", nullable = false, unique = true, length = 64)
    private String countryName;

    @Column(name = "iso_code_2", nullable = false, unique = true, length = 2)
    private String isoCode2;

    @Column(name = "iso_code_3", nullable = false, unique = true, length = 3)
    private String isoCode3;

}