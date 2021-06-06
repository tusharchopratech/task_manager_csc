package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts.action.ActionForm;

@Entity
@Table(name = "ProjectUsers")
public class BeanProjectUsers extends ActionForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String userId, projectId, Role;

	public BeanProjectUsers() {

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BeanProjectUsers(String userId, String projectId, String role) {
		super();
		this.userId = userId;
		this.projectId = projectId;
		Role = role;
	}

	@Override
	public String toString() {
		return "BeanProjectUsers [id=" + id + ", userId=" + userId
				+ ", projectId=" + projectId + ", Role=" + Role + "]";
	}

}
