package tube.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Comments generated by hbm2java
 */
@Entity
@Table(name = "comments")
public class Comment implements java.io.Serializable {

	private Integer id;
	private User user;
	private Video video;
	private String text;

	public Comment() {
	}

	public Comment(String text) {
		this.text = text;
	}

	public Comment(User user, Video video, String text) {
		this.user = user;
		this.video = video;
		this.text = text;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUsers() {
		return this.user;
	}

	public void setUsers(User user) {
		this.user = user;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "video_id")
	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	@Column(name = "text", nullable = false)
	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
