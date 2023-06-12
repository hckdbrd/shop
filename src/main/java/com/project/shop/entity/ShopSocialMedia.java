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
@Table(name = "t_shop_social_media")
public class ShopSocialMedia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "social_media_name", nullable = false, unique = true, length = 32)
    private String socialMediaName;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "media_url", nullable = false, unique = true)
    private String mediaUrl;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "icon_url", nullable = false)
    private String iconUrl;

}