package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts.action.ActionForm;

@Entity
@Table(name = "Project")
public class BeanProject extends ActionForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int projectId;
	private String startDate, endDate, isActive, projectComplitionStatus,
			projectDescripton, projectExtraColumn, projectName;
	private String projectHeadId;

	public BeanProject() {

	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
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

	public String getProjectComplitionStatus() {
		return projectComplitionStatus;
	}

	public void setProjectComplitionStatus(String projectComplitionStatus) {
		this.projectComplitionStatus = projectComplitionStatus;
	}

	public String getProjectDescripton() {
		return projectDescripton;
	}

	public void setProjectDescripton(String projectDescripton) {
		this.projectDescripton = projectDescripton;
	}

	public String getProjectExtraColumn() {
		return projectExtraColumn;
	}

	public void setProjectExtraColumn(String projectExtraColumn) {
		this.projectExtraColumn = projectExtraColumn;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectHeadId() {
		return projectHeadId;
	}

	public void setProjectHeadId(String projectHeadId) {
		this.projectHeadId = projectHeadId;
	}

	@Override
	public String toString() {
		return "BeanProject [projectId=" + projectId + ", startDate="
				+ startDate + ", endDate=" + endDate + ", isActive=" + isActive
				+ ", projectComplitionStatus=" + projectComplitionStatus
				+ ", projectDescripton=" + projectDescripton
				+ ", projectExtraColumn=" + projectExtraColumn
				+ ", projectName=" + projectName + ", projectHeadId="
				+ projectHeadId + "]";
	}

	public BeanProject(String startDate, String endDate, String isActive,
			String projectComplitionStatus, String projectDescripton,
			String projectExtraColumn, String projectName, String projectHeadId) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
		this.projectComplitionStatus = projectComplitionStatus;
		this.projectDescripton = projectDescripton;
		this.projectExtraColumn = projectExtraColumn;
		this.projectName = projectName;
		this.projectHeadId = projectHeadId;
	}

}
