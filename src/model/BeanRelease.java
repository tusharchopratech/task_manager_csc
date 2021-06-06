package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts.action.ActionForm;

@Entity
@Table(name = "release")
public class BeanRelease extends ActionForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int releaseId;
	private String startDate, endDate, isActive, projectId, buildId;

	public BeanRelease() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the releaseId
	 */
	public int getReleaseId() {
		return releaseId;
	}

	/**
	 * @param releaseId
	 *            the releaseId to set
	 */
	public void setReleaseId(int releaseId) {
		this.releaseId = releaseId;
	}

	/**
	 * @return the startDate
	 */
	public String getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate
	 *            the startDate to set
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate
	 *            the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the isActive
	 */
	public String getIsActive() {
		return isActive;
	}

	/**
	 * @param isActive
	 *            the isActive to set
	 */
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	/**
	 * @return the projectId
	 */
	public String getProjectId() {
		return projectId;
	}

	/**
	 * @param projectId
	 *            the projectId to set
	 */
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	/**
	 * @return the buildId
	 */
	public String getBuildId() {
		return buildId;
	}

	/**
	 * @param buildId
	 *            the buildId to set
	 */
	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BeanRelease [releaseId=" + releaseId + ", startDate="
				+ startDate + ", endDate=" + endDate + ", isActive=" + isActive
				+ ", projectId=" + projectId + ", buildId=" + buildId + "]";
	}

	/**
	 * @param startDate
	 * @param endDate
	 * @param isActive
	 * @param projectId
	 * @param buildId
	 */
	public BeanRelease(String startDate, String endDate, String isActive,
			String projectId, String buildId) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
		this.projectId = projectId;
		this.buildId = buildId;
	}

}
