package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.struts.action.ActionForm;

@Entity
@Table(name = "Task")
public class BeanTask extends ActionForm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String taskId;
	private String taskName;
	private String taskDescription;
	private String startDate, finishDate, initialEstimate, revisedEstimate,
			actualWorkComplete, actualStartDate, actualCompletionDate;
	private String completeY_N, deleted, assignedTo;
	private String buildId, releaseId, projectId;

	public BeanTask() {
		// TODO Auto-generated constructor stub
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getInitialEstimate() {
		return initialEstimate;
	}

	public void setInitialEstimate(String initialEstimate) {
		this.initialEstimate = initialEstimate;
	}

	public String getRevisedEstimate() {
		return revisedEstimate;
	}

	public void setRevisedEstimate(String revisedEstimate) {
		this.revisedEstimate = revisedEstimate;
	}

	public String getActualWorkComplete() {
		return actualWorkComplete;
	}

	public void setActualWorkComplete(String actualWorkComplete) {
		this.actualWorkComplete = actualWorkComplete;
	}

	public String getActualStartDate() {
		return actualStartDate;
	}

	public void setActualStartDate(String actualStartDate) {
		this.actualStartDate = actualStartDate;
	}

	public String getActualCompletionDate() {
		return actualCompletionDate;
	}

	public void setActualCompletionDate(String actualCompletionDate) {
		this.actualCompletionDate = actualCompletionDate;
	}

	public String getCompleteY_N() {
		return completeY_N;
	}

	public void setCompleteY_N(String completeY_N) {
		this.completeY_N = completeY_N;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBuildId() {
		return buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public String getReleaseId() {
		return releaseId;
	}

	public void setReleaseId(String releaseId) {
		this.releaseId = releaseId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	@Override
	public String toString() {
		return "BeanTask [id=" + id + ", taskId=" + taskId + ", taskName="
				+ taskName + ", taskDescription=" + taskDescription
				+ ", startDate=" + startDate + ", finishDate=" + finishDate
				+ ", initialEstimate=" + initialEstimate + ", revisedEstimate="
				+ revisedEstimate + ", actualWorkComplete="
				+ actualWorkComplete + ", actualStartDate=" + actualStartDate
				+ ", actualCompletionDate=" + actualCompletionDate
				+ ", completeY_N=" + completeY_N + ", deleted=" + deleted
				+ ", assignedTo=" + assignedTo + ", buildId=" + buildId
				+ ", releaseId=" + releaseId + ", projectId=" + projectId + "]";
	}

	public BeanTask(String taskId, String taskName, String taskDescription,
			String startDate, String finishDate, String initialEstimate,
			String revisedEstimate, String actualWorkComplete,
			String actualStartDate, String actualCompletionDate,
			String completeY_N, String deleted, String assignedTo,
			String buildId, String releaseId, String projectId) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.taskDescription = taskDescription;
		this.startDate = startDate;
		this.finishDate = finishDate;
		this.initialEstimate = initialEstimate;
		this.revisedEstimate = revisedEstimate;
		this.actualWorkComplete = actualWorkComplete;
		this.actualStartDate = actualStartDate;
		this.actualCompletionDate = actualCompletionDate;
		this.completeY_N = completeY_N;
		this.deleted = deleted;
		this.assignedTo = assignedTo;
		this.buildId = buildId;
		this.releaseId = releaseId;
		this.projectId = projectId;
	}

}
