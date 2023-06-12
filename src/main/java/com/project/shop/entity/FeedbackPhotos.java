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
@Table(name = "t_feedback_photos")
public class FeedbackPhotos {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "feedback_id", nullable = false, unique = true)
    private Feedback feedback;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "photo_url", nullable = false, unique = true)
    private String photoUrl;

}