package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts.action.ActionForm;

@Entity
@Table(name = "Build")
public class BeanBuild extends ActionForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int buildId;
	private String startDate, endDate, isActive, projectId, buildName,
			buildStatus, comments, buildWorkerId;

	public BeanBuild() {

	}

	public int getBuildId() {
		return buildId;
	}

	public void setBuildId(int buildId) {
		this.buildId = buildId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getBuildStatus() {
		return buildStatus;
	}

	public void setBuildStatus(String buildStatus) {
		this.buildStatus = buildStatus;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getBuildName() {
		return buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public String getBuildWorkerId() {
		return buildWorkerId;
	}

	public void setBuildWorkerId(String buildWorkerId) {
		this.buildWorkerId = buildWorkerId;
	}

	public BeanBuild(String startDate, String endDate, String isActive,
			String projectId, String buildName, String buildStatus,
			String comments, String buildWorkerId) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
		this.projectId = projectId;
		this.buildName = buildName;
		this.buildStatus = buildStatus;
		this.comments = comments;
		this.buildWorkerId = buildWorkerId;
	}

	@Override
	public String toString() {
		return "BeanBuild [buildId=" + buildId + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", isActive=" + isActive
				+ ", projectId=" + projectId + ", buildName=" + buildName
				+ ", buildStatus=" + buildStatus + ", comments=" + comments
				+ ", buildWorkerId=" + buildWorkerId + "]";
	}

}
