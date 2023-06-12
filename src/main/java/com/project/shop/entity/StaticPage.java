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
@Table(name = "t_static_page")
public class StaticPage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "page_type", nullable = false, unique = true, length = 56)
    private String pageType;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "html", nullable = false, unique = true)
    private String html;
}